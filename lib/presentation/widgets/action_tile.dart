import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({
    required this.icon,
    required this.onPressed,
    required this.substitle,
    required this.title,
    super.key,
  });

  final IconData icon;
  final String title;
  final String substitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ui.scaleWidthFactor(16),
          vertical: ui.scaleHeightFactor(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
              child: Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(width: ui.scaleHeightFactor(25)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textScaler: TextScaler.linear(ui.textScaleFactor),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    substitle,
                    textScaler: TextScaler.linear(ui.textScaleFactor),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: ui.scaleHeightFactor(20)),
            Icon(
              LineAwesomeIcons.arrow_right_solid,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
