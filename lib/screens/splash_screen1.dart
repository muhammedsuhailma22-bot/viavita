import 'package:flutter/material.dart';
import 'package:pawfect_match/screens/get_started_screen2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    fadeAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,

          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),

            pageBuilder: (_, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: const GetStartedScreen(),
              );
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: FadeTransition(
          opacity: fadeAnimation,

          child: Image.asset("assets/images/viv.png", height: 280, width: 192),
        ),
      ),
    );
  }
}
