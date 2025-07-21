import 'package:flutter/material.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({required this.status, super.key});

  final bool status;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return Row(
      children: [
        Text(
          status ? 'Online' : 'Offline',
          textScaler: TextScaler.linear(ui.textScaleFactor),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: status ? Colors.greenAccent : Colors.redAccent,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
