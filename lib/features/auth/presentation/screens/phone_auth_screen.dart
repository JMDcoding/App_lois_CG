import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/widgets/animated_button.dart';
import '../providers/auth_provider.dart';

class PhoneAuthScreen extends ConsumerStatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  ConsumerState<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends ConsumerState<PhoneAuthScreen> {
  final _phoneController = TextEditingController(text: '+242');
  final _codeController = TextEditingController();
  String? _verificationId;
  bool _codeSent = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                _codeSent ? 'VÃ©rification' : 'Connexion par tÃ©lÃ©phone',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: isDark ? AppColors.white : AppColors.darkGreen,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _codeSent
                    ? 'Entrez le code reÃ§u par SMS'
                    : 'Entrez votre numÃ©ro de tÃ©lÃ©phone congolais',
                style: TextStyle(fontSize: 14, color: AppColors.grey500),
              ),
              const SizedBox(height: 32),
              if (!_codeSent)
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: '+242 XX XXX XXXX',
                    prefixIcon: Icon(Icons.phone_android_rounded),
                  ),
                )
              else
                TextFormField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 8,
                  ),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: '------',
                    counterText: '',
                  ),
                ),
              const SizedBox(height: 32),
              AnimatedButton(
                text: _codeSent ? 'VÃ©rifier' : 'Envoyer le code',
                isLoading: _isLoading,
                onPressed: _codeSent ? _verifyCode : _sendCode,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendCode() async {
    setState(() => _isLoading = true);
    await ref.read(authNotifierProvider.notifier).verifyPhoneNumber(
      phoneNumber: _phoneController.text.trim(),
      onCodeSent: (verificationId, _) {
        setState(() {
          _verificationId = verificationId;
          _codeSent = true;
          _isLoading = false;
        });
      },
      onError: (error) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
    );
  }

  Future<void> _verifyCode() async {
    if (_verificationId == null || _codeController.text.length != 6) return;
    setState(() => _isLoading = true);
    try {
      await ref.read(authNotifierProvider.notifier).signInWithPhone(
            _verificationId!,
            _codeController.text,
          );
      if (mounted) context.go(AppRoutes.home);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Code invalide')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
