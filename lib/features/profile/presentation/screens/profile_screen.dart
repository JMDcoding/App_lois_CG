import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/providers/firebase_providers.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.white.withValues(alpha: 0.2),
                        child: Text(
                          user?.displayName?.substring(0, 1).toUpperCase() ?? 'M',
                          style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700,
                            color: AppColors.white),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(user?.displayName ?? 'Utilisateur Mobeko',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
                              color: AppColors.white)),
                      Text(user?.email ?? 'Mode invité',
                          style: TextStyle(fontSize: 13,
                              color: AppColors.white.withValues(alpha: 0.8))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _ProfileTile(icon: Icons.history_rounded, title: 'Historique',
                      onTap: () {}),
                  _ProfileTile(icon: Icons.bookmark_rounded, title: 'Favoris',
                      onTap: () => context.push(AppRoutes.favorites)),
                  _ProfileTile(icon: Icons.download_rounded, title: 'Téléchargements',
                      onTap: () {}),
                  _ProfileTile(icon: Icons.description_rounded, title: 'Mes documents',
                      onTap: () {}),
                  const Divider(height: 32),
                  _ProfileTile(icon: Icons.settings_rounded, title: 'Paramètres',
                      onTap: () => context.push(AppRoutes.settings)),
                  _ProfileTile(icon: Icons.language_rounded, title: 'Langue',
                      trailing: 'Français', onTap: () {}),
                  _ProfileTile(icon: Icons.dark_mode_rounded, title: 'Thème',
                      trailing: 'Système', onTap: () {}),
                  _ProfileTile(icon: Icons.info_outline_rounded, title: 'Ã€ propos',
                      onTap: () {}),
                  const SizedBox(height: 16),
                  if (user != null && !user.isAnonymous)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          await ref.read(authNotifierProvider.notifier).signOut();
                          if (context.mounted) context.go(AppRoutes.login);
                        },
                        icon: const Icon(Icons.logout_rounded, color: AppColors.emergency),
                        label: const Text('Déconnexion',
                            style: TextStyle(color: AppColors.emergency)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.emergency),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => context.go(AppRoutes.login),
                        icon: const Icon(Icons.login_rounded),
                        label: const Text('Se connecter'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final VoidCallback onTap;
  const _ProfileTile({required this.icon, required this.title, this.trailing, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.forestGreen),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: trailing != null
          ? Text(trailing!, style: TextStyle(color: AppColors.grey500, fontSize: 13))
          : const Icon(Icons.arrow_forward_ios_rounded, size: 14),
      onTap: onTap,
    );
  }
}
