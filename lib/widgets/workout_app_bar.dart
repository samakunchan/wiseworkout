import 'package:flutter/material.dart';
import 'package:wiseworkout/core/themes/constantes.dart';

class WorkoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WorkoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(kAssetLogo, height: 56, fit: .contain),
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size(20, 70);
}
