import 'package:flutter/material.dart';

/// Point de bascule entre l'interface mobile et desktop
const double kMobileMaxWidth = 800.0;

/// Conteneur qui centre le contenu et limite sa largeur sur les grands écrans.
/// Cela permet d'avoir une ergonomie de "site web classique" où le contenu ne s'étire pas à l'infini.
class ResponsiveMaxWidth extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ResponsiveMaxWidth({
    super.key,
    required this.child,
    this.maxWidth = 1000.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}

/// Vérifie si on est sur un grand écran (Web/Desktop)
bool isDesktopScreen(BuildContext context) {
  return MediaQuery.of(context).size.width >= kMobileMaxWidth;
}
