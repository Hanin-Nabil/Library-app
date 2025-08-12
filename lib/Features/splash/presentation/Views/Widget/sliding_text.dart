import 'package:flutter/material.dart';


class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.SlidingAnimation,
  });

  final Animation<Offset> SlidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: SlidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: SlidingAnimation,
            child: const Text(
              "Read Free Book ",
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
