import 'package:flutter/material.dart';
import 'package:tetris/src/game/game.dart';
import 'package:tetris/src/material/material.dart';
import 'package:tetris/src/panel/panel.dart';
import 'package:provider/provider.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

const SCREEN_BORDER_WIDTH = 3.0;

// const BACKGROUND_COLOR = ;

class NeonTetris extends StatelessWidget {
  static const _iconSize = 16.0;

  final Widget titleWidget;
  final Color backgroundColor;
  final Color screenBackgroundColor;
  final Color backgroundColorLighter;
  final Color backgroundColorDarker;
  final Color systemButtonsColor;
  final Color controlButtonsColor;
  final Color resetButtonColor;
  final Color brickColor;
  final Color nullBrickColor;
  final Color highlightBrickColor;
  final Widget controlUpIcon;
  final Widget controlDownIcon;
  final Widget controlRightIcon;
  final Widget controlLeftIcon;
  final BoxDecoration? screenDecoration;
  final TextStyle titleStyle;
  final TextStyle textStyle;
  final TextStyle statusPanelStyle;
  final String soundString;
  final String pauseResumeString;
  final String resetString;
  final String startString;
  final String titleString;
  final String pointsString;
  final String cleansString;
  final String levelString;
  final String nextString;
  const NeonTetris({
    Key? key,
    this.titleWidget = const IconDragon(animate: true),
    this.backgroundColor = const Color(0xffefcc19),
    this.screenBackgroundColor = const Color(0xff9ead86),
    this.backgroundColorLighter = const Color(0xFFfae36c),
    this.backgroundColorDarker = const Color(0xFF987f0f),
    this.systemButtonsColor = const Color(0xFF2dc421),
    this.controlButtonsColor = Colors.blue,
    this.resetButtonColor = Colors.red,
    this.brickColor = Colors.black87,
    this.nullBrickColor = Colors.black12,
    this.highlightBrickColor = const Color(0xFF560000),
    this.titleStyle = const TextStyle(fontSize: 20),
    this.controlUpIcon = const Icon(
      Icons.arrow_drop_up,
      size: _iconSize,
    ),
    this.controlDownIcon = const Icon(
      Icons.arrow_drop_down,
      size: _iconSize,
    ),
    this.controlRightIcon = const Icon(
      Icons.arrow_right,
      size: _iconSize,
    ),
    this.controlLeftIcon = const Icon(
      Icons.arrow_left,
      size: _iconSize,
    ),
    this.screenDecoration,
    this.textStyle = const TextStyle(fontSize: 12, color: Colors.black),
    this.statusPanelStyle = const TextStyle(fontWeight: FontWeight.bold),
    this.soundString = 'SOUNDS',
    this.pauseResumeString = 'PAUSE/RESUME',
    this.resetString = 'RESET',
    this.startString = 'START',
    this.titleString = 'TETRIX',
    this.pointsString = 'Points',
    this.cleansString = 'Cleans',
    this.levelString = 'Level',
    this.nextString = 'Next',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Sound(
        // child:

        Provider<NeonTetrisTheme>.value(
      value: NeonTetrisTheme(
        titleWidget: titleWidget,
        backgroundColor: backgroundColor,
        screenBackgroundColor: screenBackgroundColor,
        backgroundColorDarker: backgroundColorDarker,
        backgroundColorLighter: backgroundColorLighter,
        controlButtonsColor: controlButtonsColor,
        systemButtonsColor: systemButtonsColor,
        resetButtonColor: resetButtonColor,
        screenDecoration: screenDecoration ??
            BoxDecoration(border: Border.all(color: Colors.black)),
        brickColor: brickColor,
        controlDownIcon: controlDownIcon,
        controlLeftIcon: controlLeftIcon,
        controlRightIcon: controlRightIcon,
        controlUpIcon: controlUpIcon,
        nullBrickColor: nullBrickColor,
        highlightBrickColor: highlightBrickColor,
        titleStyle: titleStyle,
        textStyle: textStyle,
        statusPanelStyle: statusPanelStyle,
        soundString: soundString,
        pauseResumeString: pauseResumeString,
        resetString: resetString,
        startString: startString,
        titleString: titleString,
        pointsString: pointsString,
        cleansString: cleansString,
        levelString: levelString,
        nextString: nextString,
      ),
      child: Game(
        child: KeyboardController(
          child: MediaQuery.of(context).orientation == Orientation.landscape
              ? const PageLand()
              : const PagePortrait(),
        ),
        // ),
      ),
    );
  }
}

class NeonTetrisTheme {
  final Widget titleWidget;
  final Color backgroundColor;
  final Color screenBackgroundColor;
  final Color controlButtonsColor;
  final Color systemButtonsColor;
  final Color resetButtonColor;
  final Color backgroundColorLighter;
  final Color backgroundColorDarker;
  final Color brickColor;
  final Color nullBrickColor;
  final Color highlightBrickColor;
  final Widget controlUpIcon;
  final Widget controlDownIcon;
  final Widget controlRightIcon;
  final Widget controlLeftIcon;
  final BoxDecoration screenDecoration;
  final TextStyle titleStyle;
  final TextStyle textStyle;
  final TextStyle statusPanelStyle;
  final String soundString;
  final String pauseResumeString;
  final String resetString;
  final String startString;
  final String titleString;
  final String pointsString;
  final String cleansString;
  final String levelString;
  final String nextString;
  final bool enableSoundButton;

  const NeonTetrisTheme({
    required this.titleWidget,
    required this.backgroundColor,
    required this.screenBackgroundColor,
    required this.backgroundColorDarker,
    required this.backgroundColorLighter,
    required this.controlButtonsColor,
    required this.systemButtonsColor,
    required this.resetButtonColor,
    required this.brickColor,
    required this.nullBrickColor,
    required this.highlightBrickColor,
    required this.controlUpIcon,
    required this.controlDownIcon,
    required this.controlRightIcon,
    required this.controlLeftIcon,
    required this.screenDecoration,
    required this.titleStyle,
    required this.statusPanelStyle,
    required this.textStyle,
    required this.soundString,
    required this.pauseResumeString,
    required this.resetString,
    required this.startString,
    required this.titleString,
    required this.pointsString,
    required this.cleansString,
    required this.levelString,
    required this.nextString,
    this.enableSoundButton = false,
  });
}
