import 'dart:math';

import 'package:flutter/material.dart';

enum CircleSide { left, right }

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  const HalfCircleClipper({required this.side});
  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();

    late final Offset offset;
    late final bool clockWise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockWise = false;
        break;

      case CircleSide.right:
        offset = Offset(0, size.height);
        clockWise = true;
        break;
    }

    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockWise,
    );

    path.close();
    return path;
  }
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}

class ChainedAnimationPage extends StatefulWidget {
  const ChainedAnimationPage({super.key});

  @override
  State<ChainedAnimationPage> createState() => _ChainedAnimationPageState();
}

class _ChainedAnimationPageState extends State<ChainedAnimationPage>
    with TickerProviderStateMixin {
  late final AnimationController _counterClockWiseRotationController;
  late Animation<double> _counterClockWiseRotationAnimation;

  late Animation<double> _flipAnimation;
  @override
  void initState() {
    super.initState();
    _counterClockWiseRotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _counterClockWiseRotationAnimation =
        Tween<double>(begin: 0, end: -(pi / 2)).animate(
      CurvedAnimation(
        parent: _counterClockWiseRotationController,
        curve: const Interval(0, 0.4, curve: Curves.bounceOut),
      ),
    );

    _flipAnimation = Tween<double>(begin: 0, end: pi).animate(
      CurvedAnimation(
        parent: _counterClockWiseRotationController,
        curve: const Interval(0.45, 1, curve: Curves.bounceOut),
      ),
    );

    _counterClockWiseRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counterClockWiseRotationAnimation = Tween<double>(
                begin: _counterClockWiseRotationAnimation.value,
                end: _counterClockWiseRotationAnimation.value + -(pi / 2))
            .animate(
          CurvedAnimation(
            parent: _counterClockWiseRotationController,
            curve: const Interval(0, 0.4, curve: Curves.bounceOut),
          ),
        );
        _flipAnimation = Tween<double>(
                begin: _flipAnimation.value, end: _flipAnimation.value + pi)
            .animate(
          CurvedAnimation(
            parent: _counterClockWiseRotationController,
            curve: const Interval(0.45, 1, curve: Curves.bounceOut),
          ),
        );

        _counterClockWiseRotationController
          ..reset()
          ..forward();
      }
    });

    _counterClockWiseRotationController.forward
        .delayed(const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _counterClockWiseRotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animation'),
        ),
        body: SafeArea(
          child: AnimatedBuilder(
              animation: _counterClockWiseRotationController,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateZ(
                      _counterClockWiseRotationAnimation.value,
                    )
                    ..rotateY(_flipAnimation.value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipPath(
                        clipper: const HalfCircleClipper(side: CircleSide.left),
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Colors.blue,
                        ),
                      ),
                      ClipPath(
                        clipper:
                            const HalfCircleClipper(side: CircleSide.right),
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Colors.yellow,
                        ),
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
