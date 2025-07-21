import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';

class Bar extends StatelessWidget {
  const Bar({
    required this.title,
    this.backButtonEnabled = false,
    this.widgets,
    super.key,
  });

  final String title;
  final bool? backButtonEnabled;
  final List<Widget>? widgets;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ui.scaleWidthFactor(16),
            vertical: ui.scaleHeightFactor(10),
          ),
          child: Row(
            children: [
              if (backButtonEnabled!)
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ui.scaleWidthFactor(16),
                    ),
                    child: Icon(
                      LineAwesomeIcons.arrow_left_solid,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              Text(
                title,
                textScaler: TextScaler.linear(ui.textScaleFactor),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              if (widgets != null) ...widgets!,
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey.withOpacity(0.2),
        ),
        SizedBox(height: ui.scaleHeightFactor(10)),
      ],
    );
  }
}
