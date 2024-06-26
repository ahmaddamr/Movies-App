import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/splash_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplashWidget(),
    );
  }
}
