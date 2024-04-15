import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/constans.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> SlidingAnimation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    SlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        GoRouter.of(context).push('/HomeScreen');
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(Apptheme.splashImage),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return SlideTransition(
              position: SlidingAnimation,
              child: const Center(
                child: Text(
                  'Flutter Movies App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
