import 'package:flutter/material.dart';
import 'package:wiseworkout/widgets/workout_app_bar.dart';
import 'package:wiseworkout/widgets/workout_drawer.dart';

class ScreenScaffoldWithDrawer extends StatelessWidget {
  const ScreenScaffoldWithDrawer({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WorkoutAppBar(),
      drawer: const WorkoutDrawer(),
      body: child,
    );
  }
}
