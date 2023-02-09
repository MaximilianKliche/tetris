import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tetris/src/game/game.dart';
import 'package:tetris/src/neon_tetris.dart';
import 'package:provider/provider.dart';

class GameController extends StatelessWidget {
  const GameController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: const [
          Expanded(child: LeftController()),
          Expanded(child: DirectionController()),
        ],
      ),
    );
  }
}

const Size _DIRECTION_BUTTON_SIZE = Size(48, 48);

const Size _SYSTEM_BUTTON_SIZE = Size(28, 28);

const double _DIRECTION_SPACE = 16;

class DirectionController extends StatelessWidget {
  const DirectionController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox.fromSize(size: _DIRECTION_BUTTON_SIZE * 2.8),
        Transform.rotate(
          angle: math.pi / 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: context.read<NeonTetrisTheme>().controlUpIcon,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: context.read<NeonTetrisTheme>().controlRightIcon,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: context.read<NeonTetrisTheme>().controlLeftIcon,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: context.read<NeonTetrisTheme>().controlDownIcon,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Transform.rotate(
          angle: math.pi / 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: _DIRECTION_SPACE),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _Button(
                      color:
                          context.read<NeonTetrisTheme>().controlButtonsColor,
                      enableLongPress: false,
                      size: _DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).rotate();
                      }),
                  const SizedBox(width: _DIRECTION_SPACE),
                  _Button(
                      color:
                          context.read<NeonTetrisTheme>().controlButtonsColor,
                      size: _DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).right();
                      }),
                ],
              ),
              const SizedBox(height: _DIRECTION_SPACE),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _Button(
                      color:
                          context.read<NeonTetrisTheme>().controlButtonsColor,
                      size: _DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).left();
                      }),
                  const SizedBox(width: _DIRECTION_SPACE),
                  _Button(
                    color: context.read<NeonTetrisTheme>().controlButtonsColor,
                    size: _DIRECTION_BUTTON_SIZE,
                    onTap: () {
                      Game.of(context).down();
                    },
                  ),
                ],
              ),
              const SizedBox(height: _DIRECTION_SPACE),
            ],
          ),
        ),
      ],
    );
  }
}

class SystemButtonGroup extends StatelessWidget {
  const SystemButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        if (context.read<NeonTetrisTheme>().enableSoundButton)
          _Description(
            text: context.read<NeonTetrisTheme>().soundString,
            child: _Button(
                size: _SYSTEM_BUTTON_SIZE,
                color: context.read<NeonTetrisTheme>().systemButtonsColor,
                enableLongPress: false,
                onTap: () {
                  Game.of(context).soundSwitch();
                }),
          ),
        _Description(
          text: context.read<NeonTetrisTheme>().pauseResumeString,
          child: _Button(
              size: _SYSTEM_BUTTON_SIZE,
              color: context.read<NeonTetrisTheme>().systemButtonsColor,
              enableLongPress: false,
              onTap: () {
                Game.of(context).pauseOrResume();
              }),
        ),
        _Description(
          text: context.read<NeonTetrisTheme>().resetString,
          child: _Button(
              size: _SYSTEM_BUTTON_SIZE,
              enableLongPress: false,
              color: context.read<NeonTetrisTheme>().resetButtonColor,
              onTap: () {
                Game.of(context).reset();
              }),
        )
      ],
    );
  }
}

class BigButton extends StatelessWidget {
  const BigButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Description(
      text: context.read<NeonTetrisTheme>().startString,
      child: _Button(
          color: context.read<NeonTetrisTheme>().controlButtonsColor,
          enableLongPress: false,
          size: const Size(90, 90),
          onTap: () {
            Game.of(context).drop();
          }),
    );
  }
}

class LeftController extends StatelessWidget {
  const LeftController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const <Widget>[
        SystemButtonGroup(),
        Expanded(
          child: Center(
            child: BigButton(),
          ),
        )
      ],
    );
  }
}

class _Button extends StatefulWidget {
  final Size size;
  // final Widget? icon;

  final VoidCallback onTap;

  ///the color of button
  final Color color;

  final bool enableLongPress;

  const _Button({
    Key? key,
    required this.size,
    required this.onTap,
    // this.icon,
    required this.color,
    this.enableLongPress = true,
  }) : super(key: key);

  @override
  _ButtonState createState() {
    return _ButtonState();
  }
}

///show a hint text for child widget
class _Description extends StatelessWidget {
  final String text;

  final Widget child;

  final AxisDirection direction;

  const _Description({
    Key? key,
    required this.text,
    this.direction = AxisDirection.down,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (direction) {
      case AxisDirection.right:
        widget = Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[child, const SizedBox(width: 8), Text(text)]);
        break;
      case AxisDirection.left:
        widget = Row(
          children: <Widget>[Text(text), const SizedBox(width: 8), child],
          mainAxisSize: MainAxisSize.min,
        );
        break;
      case AxisDirection.up:
        widget = Column(
          children: <Widget>[Text(text), const SizedBox(height: 8), child],
          mainAxisSize: MainAxisSize.min,
        );
        break;
      case AxisDirection.down:
        widget = Column(
          children: <Widget>[child, const SizedBox(height: 8), Text(text)],
          mainAxisSize: MainAxisSize.min,
        );
        break;
    }
    return DefaultTextStyle(
      child: widget,
      style: context.read<NeonTetrisTheme>().textStyle,
    );
  }
}

class _ButtonState extends State<_Button> {
  Timer? _timer;

  bool _tapEnded = false;

  late Color _color;

  @override
  void didUpdateWidget(_Button oldWidget) {
    super.didUpdateWidget(oldWidget);
    _color = widget.color;
  }

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _color,
      elevation: 2,
      shape: const CircleBorder(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) async {
          setState(() {
            _color = widget.color.withOpacity(0.5);
          });
          if (_timer != null) {
            return;
          }
          _tapEnded = false;
          widget.onTap();
          if (!widget.enableLongPress) {
            return;
          }
          await Future.delayed(const Duration(milliseconds: 300));
          if (_tapEnded) {
            return;
          }
          _timer = Timer.periodic(const Duration(milliseconds: 60), (t) {
            if (!_tapEnded) {
              widget.onTap();
            } else {
              t.cancel();
              _timer = null;
            }
          });
        },
        onTapCancel: () {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        onTapUp: (_) {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        child: SizedBox.fromSize(
          size: widget.size,
        ),
      ),
    );
  }
}
