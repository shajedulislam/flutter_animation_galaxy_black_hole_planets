import 'dart:math';
import 'package:flutter/material.dart';
import '../reusables/screen_blocks.dart';
import 'planet_positioning.dart';

class PlanetPainter extends CustomPainter {
  List<PlanetPositioning> planets;
  List<int> starsX;
  List<int> starsY;
  List<int> starsSize;
  Duration time;

  PlanetPainter(this.planets, this.time, this.starsX, this.starsY, this.starsSize);

  @override
  void paint(Canvas canvas, Size size) {
    List randColors = [
      Colors.white,
      Colors.white.withOpacity(0.70),
    ];
    final paint = Paint()..color = Colors.white;

    final paint2 = Paint()..color = randColors[Random().nextInt(2)];
    planets.forEach(
      (planet) {
        var progress = planet.animationProgress.progress(time);
        final animation = planet.tween.transform(progress);

        //Positio update
        final position = Offset(animation["x"] * size.width, animation["y"] * size.height);

        //shape based on randomly choosen
        planet.shape == 'cir'
            ? canvas.drawCircle(position, planet.size - animation["y"] * blocks.horizontal(9), paint)
            : canvas.drawRect(
                position &
                    Size(
                      (planet.size + blocks.horizontal(3)) - animation["y"] * blocks.horizontal(9),
                      planet.size - animation["y"] * blocks.horizontal(7),
                    ),
                paint,
              );
      },
    );

    //galaxy stars drawn here
    for (int i = 0; i < starsX.length; i++) {
      canvas.drawOval(Offset(starsX[i].toDouble(), starsY[i].toDouble()) & Size(starsSize[i].toDouble(), starsSize[i].toDouble()), paint);
      canvas.drawOval(Offset(starsY[i].toDouble(), starsX[i].toDouble()) & Size(starsSize[i].toDouble(), starsSize[i].toDouble()), paint2);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
