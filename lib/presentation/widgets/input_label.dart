import 'package:flutter/material.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({required this.label, this.padding = 16, super.key});

  final String label;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 16),
        child: Text(
          label,
          textScaler: TextScaler.linear(ui.textScaleFactor),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
