import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    required this.onChange,
    super.key,
    this.hintText = '',
    this.obscureText = false,
    this.initialValue = '',
    this.error = '',
    this.prefixIcon,
    this.suffixWidget,
    this.padding,
    this.prefixWidget,
    this.textInputType,
    this.inputFilters,
    this.controller,
  });

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final bool? obscureText;
  final String? error;
  final String? initialValue;
  final EdgeInsets? padding;
  final Widget? prefixWidget;
  final List<TextInputFormatter>? inputFilters;
  final void Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding:
            padding ??
            EdgeInsets.symmetric(horizontal: ui.scaleWidthFactor(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              //  initialValue: initialValue,
              controller: controller,
              keyboardType: textInputType,
              inputFormatters: inputFilters,
              obscureText: obscureText ?? false,
              onTapOutside: (PointerDownEvent event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(
                    ui.scaleWidthFactor(12),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(
                    ui.scaleWidthFactor(12),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(
                    ui.scaleWidthFactor(12),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(
                    ui.scaleWidthFactor(12),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(
                    ui.scaleWidthFactor(12),
                  ),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.grey.withOpacity(0.7),
                ),
                suffixIcon: suffixWidget,
                prefixIcon:
                    prefixWidget ??
                    (prefixIcon != null
                        ? Icon(
                            prefixIcon,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : null),
              ),
              onChanged: onChange,
            ),
            if (error != null && error != '')
              SizedBox(height: ui.scaleWidthFactor(5)),
            if (error != null && error != '')
              Text(
                error!,
                textScaler: TextScaler.linear(ui.textScaleFactor),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.red.withOpacity(0.7),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
