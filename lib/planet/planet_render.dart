import 'dart:math';
import 'package:flutter/material.dart';
import '../reusables/screen_blocks.dart';
import 'package:simple_animations/simple_animations.dart';
import 'planet_painter.dart';
import 'planet_positioning.dart';

class PlanetRender extends StatefulWidget {
  @override
  _PlanetRenderState createState() => _PlanetRenderState();
}

class _PlanetRenderState extends State<PlanetRender> {
  final Random random = Random();
  List<int> starsX = [];
  List<int> starsY = [];
  List<int> starsSize = [];

  final List<PlanetPositioning> planets = [];

  @override
  void initState() {
    List.generate(3, (index) {
      planets.add(PlanetPositioning(random));
    });
    List.generate(100, (index) {
      starsX.add(Random().nextInt(blocks.horizontal(100).toInt()));
      starsY.add(Random().nextInt(blocks.vertical(100).toInt()));
      starsSize.add(Random().nextInt(3));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Rendering(
      onTick: _simulatePlanets,
      builder: (context, time) {
        return CustomPaint(
          painter: PlanetPainter(planets, time, starsX, starsY, starsSize),
        );
      },
    );
  }

  _simulatePlanets(Duration time) {
    planets.forEach((planet) => planet.maintainRestart(time));
  }
}
