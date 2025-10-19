import 'package:flutter/material.dart';
import '../../core/utils/responsive_helper.dart';

/// Wrapper widget pour créer des layouts responsives avec sidebar optionnelle
class ResponsiveLayout extends StatelessWidget {
  final Widget child;
  final Widget? sidebar;
  final bool showSidebar;
  final double sidebarWidth;

  const ResponsiveLayout({
    super.key,
    required this.child,
    this.sidebar,
    this.showSidebar = true,
    this.sidebarWidth = 280.0,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobileOrTablet(context);

    // Sur mobile/tablette, on n'affiche pas la sidebar
    if (isMobile || !showSidebar || sidebar == null) {
      return child;
    }

    // Sur desktop, afficher sidebar + contenu côte à côte
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sidebar
        SizedBox(
          width: sidebarWidth,
          child: sidebar!,
        ),

        // Contenu principal
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
