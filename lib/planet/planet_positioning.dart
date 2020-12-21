import 'dart:math';
import 'package:flutter/material.dart';
import '../reusables/screen_blocks.dart';
import 'package:simple_animations/simple_animations.dart';

class PlanetPositioning {
  Animatable tween;
  double size;
  String shape;
  // ignore: deprecated_member_use
  AnimationProgress animationProgress;
  Random random;

  PlanetPositioning(this.random) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    final startPosition = Offset(random.nextDouble(), -random.nextDouble());
    final endPosition = Offset(0.5, 0.5);
    final duration = Duration(milliseconds: 3000 + random.nextInt(2000));

    List<String> shapeList = ["cir", 'rec'];

    //To track position
    // ignore: deprecated_member_use
    tween = MultiTrackTween([
      // ignore: deprecated_member_use
      Track("x").add(duration, Tween(begin: startPosition.dx, end: endPosition.dx), curve: Curves.linear),
      // ignore: deprecated_member_use
      Track("y").add(duration, Tween(begin: startPosition.dy, end: endPosition.dy), curve: Curves.linear),
    ]);
    // ignore: deprecated_member_use
    animationProgress = AnimationProgress(duration: duration, startTime: time);

    //setting different planet size
    size = blocks.horizontal((5 + Random().nextInt(2)).toDouble());

    //random shape selection
    shape = shapeList[Random().nextInt(2)];
  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}
