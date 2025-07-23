import 'package:flutter/material.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/widgets/app_button.dart';

class EmptyStateCard extends StatelessWidget {
  const EmptyStateCard({
    required this.title,
    required this.description,
    this.onPressed,
    this.buttonText = '',
    this.showButton = false,
    super.key,
  });

  final String title;
  final String description;
  final String? buttonText;
  final VoidCallback? onPressed;
  final bool? showButton;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/png/box.png',
          height: ui.scaleHeightFactor(130),
          width: ui.scaleWidthFactor(130),
        ),
        SizedBox(height: ui.scaleHeightFactor(20)),
        Text(
          title,
          textScaler: TextScaler.linear(ui.textScaleFactor),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: ui.scaleHeightFactor(20)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ui.scaleWidthFactor(20)),
          child: Text(
            description,
            textScaler: TextScaler.linear(ui.textScaleFactor),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: const Color(0xFF92918A),
            ),
          ),
        ),
        SizedBox(height: ui.scaleHeightFactor(20)),
        if (showButton ?? false)
          AppButton(
            onPressed: onPressed ?? () {},
            text: buttonText ?? '',
            isFullWidth: false,
          ),
      ],
    );
  }
}
