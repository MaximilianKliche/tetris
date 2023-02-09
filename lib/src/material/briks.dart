import 'package:flutter/material.dart';

class BrikSize extends InheritedWidget {
  const BrikSize({
    Key? key,
    required this.size,
    required Widget child,
  }) : super(key: key, child: child);

  final Size size;

  static BrikSize of(BuildContext context) {
    final brikSize = context.dependOnInheritedWidgetOfExactType<BrikSize>();
    assert(brikSize != null, "....");
    return brikSize!;
  }

  @override
  bool updateShouldNotify(BrikSize old) {
    return old.size != size;
  }
}

///the basic brik for game panel
class Brik extends StatelessWidget {
  final Color color;

  const Brik({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = BrikSize.of(context).size.width;
    return SizedBox.fromSize(
      size: BrikSize.of(context).size,
      child: Container(
        margin: EdgeInsets.all(0.05 * width),
        padding: EdgeInsets.all(0.1 * width),
        decoration: BoxDecoration(
            border: Border.all(width: 0.10 * width, color: color)),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
