import 'dart:math';
import 'package:flutter/material.dart';
import '../reusables/paths.dart';
import '../reusables/screen_blocks.dart';
import 'package:ud_widgets/ud_widgets.dart';

class BlackHole extends StatelessWidget {
  final AnimationController animationController;
  BlackHole({this.animationController});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: UdAssetImage(
        imagePath: ProjectPaths.image_galaxy,
        width: blocks.horizontal(75),
        height: blocks.horizontal(75),
        child: Container(
          margin: EdgeInsets.only(
            top: blocks.horizontal(25),
            bottom: blocks.horizontal(21),
            left: blocks.horizontal(25),
            right: blocks.horizontal(25),
          ),
          child: UdAssetImage(
            imagePath: ProjectPaths.image_black_hole,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
      builder: (BuildContext context, Widget _widget) {
        return Transform(
          transform: Matrix4.identity()..rotateX(pi * 2 * 0.14),
          child: Transform.rotate(
            angle: animationController.value * 6.3,
            child: _widget,
          ),
        );
      },
    );
  }
}
