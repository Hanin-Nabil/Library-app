import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sliding_text.dart';

class Splashviewbody extends StatefulWidget {
  const Splashviewbody({super.key});

  @override
  State<Splashviewbody> createState() => _SplashviewbodyState();
}

class _SplashviewbodyState extends State<Splashviewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> SlidingAnimation;
  @override
  void initState() {
    iniSlidingAnimation();
    navigatorhome();
    super.initState();
  }

  void navigatorhome() {
    Future.delayed(const Duration(seconds: 5), () {
      GoRouter.of(context).push(AppRouter.khomepage);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.logo,
        ),
        const SizedBox(
          height: 4,
        ),
        SlidingText(SlidingAnimation: SlidingAnimation),
      ],
    );
  }

  void iniSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    SlidingAnimation = Tween(begin: const Offset(0, 2), end: Offset(0, 0))
        .animate(animationController);
    animationController.forward();
  }
}
