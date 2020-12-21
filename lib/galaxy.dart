import 'package:flutter/material.dart';
import 'reusables/screen_blocks.dart';
import 'planet/planet_render.dart';
import 'blackhole/blackhole.dart';

class Galaxy extends StatefulWidget {
  @override
  _GalaxyState createState() => new _GalaxyState();
}

class _GalaxyState extends State<Galaxy> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 50),
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    blocks.init(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: blocks.horizontal(30)),
          child: BlackHole(
            animationController: animationController,
          ),
        ),
        Positioned.fill(
          child: PlanetRender(),
        ),
      ],
    );
  }
}
