import 'package:flutter/material.dart';
import 'package:neon_tetris/src/neon_tetris.dart';
import 'package:neon_tetris/src/panel/panel.dart';
import 'package:provider/provider.dart';

part 'page_land.dart';

class PagePortrait extends StatelessWidget {
  const PagePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenW = size.width * 0.8;

    return SizedBox.expand(
      child: Container(
        color: context.read<NeonTetrisTheme>().backgroundColor,
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Column(
            children: <Widget>[
              const Spacer(),
              _ScreenDecoration(child: Screen(width: screenW)),
              const Spacer(flex: 2),
              const GameController(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScreenDecoration extends StatelessWidget {
  final Widget child;

  const _ScreenDecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightBorder = BorderSide(
        color: context.read<NeonTetrisTheme>().backgroundColorLighter,
        width: SCREEN_BORDER_WIDTH);
    final darkBorder = BorderSide(
        color: context.read<NeonTetrisTheme>().backgroundColorDarker,
        width: SCREEN_BORDER_WIDTH);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: darkBorder,
          left: darkBorder,
          right: lightBorder,
          bottom: lightBorder,
        ),
      ),
      child: Container(
        decoration: context.read<NeonTetrisTheme>().screenDecoration,
        child: Container(
          padding: const EdgeInsets.all(3),
          color: context.read<NeonTetrisTheme>().screenBackgroundColor,
          child: child,
        ),
      ),
    );
  }
}
