import 'package:flutter/material.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/widgets/app_loader.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.text,
    this.isFullWidth = true,
    this.isLoading = false,
    super.key,
  });

  final bool? isFullWidth;
  final String text;
  final VoidCallback onPressed;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isFullWidth ?? true ? 16 : 0),
      child: SizedBox(
        width: isFullWidth ?? true ? MediaQuery.of(context).size.width : null,
        height: isFullWidth ?? true ? 50 : null,
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: isLoading!
              ? const AppLoader()
              : Text(
                  text,
                  textScaler: TextScaler.linear(ui.textScaleFactor),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
