import 'package:flutter/material.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({this.size = 15, this.color = Colors.white, super.key});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return SizedBox(
      height: ui.scaleWidthFactor(size),
      width: ui.scaleWidthFactor(size),
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
