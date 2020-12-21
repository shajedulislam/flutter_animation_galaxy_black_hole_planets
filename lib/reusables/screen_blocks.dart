import 'package:flutter/widgets.dart';

class BlockConfiguration {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  //returns block size of vertical axis
  double horizontal(double blocks) {
    return blockSizeHorizontal * blocks;
  }

  //returns block size of vertical axis
  double vertical(double blocks) {
    return blockSizeVertical * blocks;
  }
}

BlockConfiguration blocks = BlockConfiguration();
