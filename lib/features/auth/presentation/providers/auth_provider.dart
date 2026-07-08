import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/providers/firebase_providers.dart';

/// Ã‰tat d'authentification
enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

/// Ã‰tat de l'authentification
class AuthState {
  final AuthStatus status;
  final User? user;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Notifier pour gÃ©rer l'authentification
class AuthNotifier extends StateNotifier<AuthState> {
  final FirebaseAuth _auth;

  AuthNotifier(this._auth) : super(const AuthState()) {
    // Ã‰couter les changements d'Ã©tat d'authentification
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        state = AuthState(status: AuthStatus.authenticated, user: user);
      } else {
        state = const AuthState(status: AuthStatus.unauthenticated);
      }
    });
  }

  /// Connexion avec email et mot de passe
  Future<void> signInWithEmail(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = AuthState(status: AuthStatus.authenticated, user: result.user);
    } on FirebaseAuthException catch (e) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: _getFirebaseErrorMessage(e.code),
      );
      rethrow;
    }
  }

  /// Inscription avec email et mot de passe
  Future<void> signUpWithEmail(String email, String password, String name) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user?.updateDisplayName(name);
      state = AuthState(status: AuthStatus.authenticated, user: result.user);
    } on FirebaseAuthException catch (e) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: _getFirebaseErrorMessage(e.code),
      );
      rethrow;
    }
  }

  /// Connexion avec Google
  Future<void> signInWithGoogle() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final googleProvider = GoogleAuthProvider();
      final result = await _auth.signInWithProvider(googleProvider);
      state = AuthState(status: AuthStatus.authenticated, user: result.user);
    } catch (e) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: 'Erreur de connexion Google',
      );
      rethrow;
    }
  }

  /// Connexion avec tÃ©lÃ©phone
  Future<void> signInWithPhone(String verificationId, String smsCode) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final result = await _auth.signInWithCredential(credential);
      state = AuthState(status: AuthStatus.authenticated, user: result.user);
    } catch (e) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: 'Code de vÃ©rification invalide',
      );
      rethrow;
    }
  }

  /// Envoyer le code de vÃ©rification par tÃ©lÃ©phone
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId, int? resendToken) onCodeSent,
    required Function(String error) onError,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        onError(_getFirebaseErrorMessage(e.code));
      },
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: (_) {},
      timeout: const Duration(seconds: 60),
    );
  }

  /// Connexion anonyme
  Future<void> signInAnonymously() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final result = await _auth.signInAnonymously();
      state = AuthState(status: AuthStatus.authenticated, user: result.user);
    } catch (e) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: 'Erreur de connexion anonyme',
      );
      rethrow;
    }
  }

  /// RÃ©initialiser le mot de passe
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  /// DÃ©connexion
  Future<void> signOut() async {
    await _auth.signOut();
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  /// Messages d'erreur Firebase en franÃ§ais
  String _getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Aucun utilisateur trouvÃ© avec cet email';
      case 'wrong-password':
        return 'Mot de passe incorrect';
      case 'email-already-in-use':
        return 'Cet email est dÃ©jÃ  utilisÃ©';
      case 'weak-password':
        return 'Le mot de passe est trop faible';
      case 'invalid-email':
        return 'Email invalide';
      case 'too-many-requests':
        return 'Trop de tentatives. RÃ©essayez plus tard.';
      case 'invalid-phone-number':
        return 'NumÃ©ro de tÃ©lÃ©phone invalide';
      case 'invalid-verification-code':
        return 'Code de vÃ©rification invalide';
      default:
        return 'Une erreur est survenue. Veuillez rÃ©essayer.';
    }
  }
}

/// Provider pour l'authentification
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return AuthNotifier(auth);
});
