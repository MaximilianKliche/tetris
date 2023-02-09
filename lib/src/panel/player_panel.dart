import 'package:flutter/material.dart';
import 'package:tetris/src/game/game.dart';
import 'package:tetris/src/material/material.dart';
import 'package:tetris/src/neon_tetris.dart';
import 'package:provider/provider.dart';

const _PLAYER_PANEL_PADDING = 6;

Size getBrikSizeForScreenWidth(double width) {
  return Size.square((width - _PLAYER_PANEL_PADDING) / GAME_PAD_MATRIX_W);
}

///the matrix of player content
class PlayerPanel extends StatelessWidget {
  //the size of player panel
  final Size size;

  PlayerPanel({
    Key? key,
    required double width,
  })  : assert(width != 0),
        size = Size(width, width * 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("size : $size");
    return SizedBox.fromSize(
      size: size,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Stack(
          children: <Widget>[
            _PlayerPad(),
            _GameUninitialized(),
          ],
        ),
      ),
    );
  }
}

class _PlayerPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: GameState.of(context).data.map((list) {
        return Row(
          children: list.map((b) {
            return b == 1
                ? Brik(
                    color: context.read<NeonTetrisTheme>().brickColor,
                  )
                : b == 2
                    ? Brik(
                        color:
                            context.read<NeonTetrisTheme>().highlightBrickColor,
                      )
                    : Brik(
                        color: context.read<NeonTetrisTheme>().nullBrickColor,
                      );
          }).toList(),
        );
      }).toList(),
    );
  }
}

class _GameUninitialized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (GameState.of(context).states == GameStates.none) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            context.read<NeonTetrisTheme>().titleWidget,
            const SizedBox(height: 16),
            Text(
              context.read<NeonTetrisTheme>().titleString,
              style: context.read<NeonTetrisTheme>().titleStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
