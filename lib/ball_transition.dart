// ignore_for_file: non_constant_identifier_names

library ball_transition;

import 'package:flutter/material.dart';

/// Creates a custom route with a ball animation transition.
///
/// [secondPage] is the next page to navigate to.
/// [ballColorGradient] defines the gradient colors of the animated ball.
/// [backgroundColor] defines the background color of the screen during the animation.
/// [transitionDuration] defines the transition duration, allowing for custom duration (in seconds or milliseconds).
Route createBallTransitionRoute({
  required Widget secondPage,
  List<Color> ballColorGradient = const [
    Color.fromARGB(255, 107, 220, 7),
    Color.fromARGB(255, 249, 224, 4),
  ],
  Alignment linearGradient_begin = Alignment.topCenter,
  Alignment linearGradient_end = Alignment.bottomCenter,
  Color backgroundColor = const Color.fromARGB(255, 254, 245, 255),
  Duration transitionDuration = const Duration(seconds: 2),
}) {
  if (ballColorGradient.length < 2) {
    throw ArgumentError(
        'The ballColorGradient must contain at least two colors.');
  }

  return PageRouteBuilder(
    transitionDuration: transitionDuration,
    pageBuilder: (context, animation, secondaryAnimation) => secondPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double yOffset = TweenSequence([
            TweenSequenceItem(
              tween: Tween<double>(begin: 1000, end: 0)
                  .chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut)),
              weight: 0.4,
            ),
            TweenSequenceItem(
              tween: Tween<double>(begin: 0, end: 0),
              weight: 0.1,
            ),
            TweenSequenceItem(
              tween: Tween<double>(begin: 0, end: 0),
              weight: 0.1,
            ),
            TweenSequenceItem(
              tween: Tween<double>(begin: 0, end: 0),
              weight: 0.1,
            ),
          ]).animate(animation).value;

          double sizeFactor = TweenSequence([
            TweenSequenceItem(
              tween: Tween<double>(begin: 50, end: 50),
              weight: 0.4,
            ),
            TweenSequenceItem(
              tween: Tween<double>(begin: 50, end: 200),
              weight: 0.04,
            ),
            TweenSequenceItem(
              tween: Tween<double>(begin: 200, end: 500),
              weight: 0.04,
            ),
            TweenSequenceItem(
              tween: Tween<double>(begin: 500, end: 1000),
              weight: 0.04,
            ),
          ]).animate(animation).value;

          return Stack(
            children: [
              // خلفية الشاشة
              Container(
                color: backgroundColor,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2 -
                    yOffset -
                    sizeFactor / 2,
                left: MediaQuery.of(context).size.width / 2 - sizeFactor / 2,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: ballColorGradient,
                      begin: linearGradient_begin,
                      end: linearGradient_end,
                    ).createShader(bounds);
                  },
                  child: Container(
                    width: sizeFactor,
                    height: sizeFactor,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              FadeTransition(
                opacity: Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
                  ),
                ),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: const Interval(0.1, 1.0, curve: Curves.easeOut),
                    ),
                  ),
                  child: child!,
                ),
              ),
            ],
          );
        },
        child: child,
      );
    },
  );
}
