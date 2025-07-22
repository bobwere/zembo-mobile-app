import 'package:flutter/material.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/widgets/app_button.dart';

class NotificationPermissionDialog extends StatelessWidget {
  const NotificationPermissionDialog({
    required this.context,
    required this.onAllowed,
    required this.onDismissed,
    super.key,
  });

  final BuildContext context;
  final VoidCallback onAllowed;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('assets/images/png/dialog_notification_icon.png'),
            SizedBox(height: ui.scaleWidthFactor(15)),
            Text(
              'Notifications',
              textScaler: TextScaler.linear(ui.textScaleFactor),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ui.scaleWidthFactor(20)),
            const Text(
              'Please enable notifications to receive updates and reminders',
              style: TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ui.scaleWidthFactor(25)),
            SizedBox(
              height: ui.scaleWidthFactor(48),
              width: MediaQuery.of(context).size.width,
              child: AppButton(
                text: 'Allow',
                onPressed: () async {
                  onAllowed();
                },
              ),
            ),
            SizedBox(height: ui.scaleWidthFactor(10)),
            SizedBox(
              height: ui.scaleWidthFactor(48),
              width: MediaQuery.of(context).size.width,
              child: AppButton(
                text: 'Skip for now',
                onPressed: () async {
                  onDismissed();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
