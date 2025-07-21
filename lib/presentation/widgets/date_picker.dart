// ignore_for_file: document_ignores

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    required this.onChanged,
    required this.selectedDate,
    super.key,
    this.initialDate,
    this.selectableDayPredicate,
    this.firstDate,
    this.lastDate,
    this.helpText,
    this.icon,
    this.suffixIcon,
    this.readOnly,
  });
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String selectedDate;
  final String? helpText;
  final Widget? icon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final void Function(DateTime?)? onChanged;
  final bool Function(DateTime)? selectableDayPredicate;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: ui.scaleWidthFactor(5),
          horizontal: ui.scaleWidthFactor(16),
        ),
        child: Container(
          height: ui.scaleWidthFactor(65),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(ui.scaleWidthFactor(16)),
                child: icon,
              ),
              Expanded(
                child: Text(
                  selectedDate,
                  textScaler: TextScaler.linear(ui.textScaleFactor),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ui.scaleWidthFactor(10)),
                child: SvgPicture.asset(
                  'assets/images/calendar.svg',
                  height: ui.scaleWidthFactor(25),
                  width: ui.scaleWidthFactor(25),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () async {
        if (!(readOnly ?? false)) {
          final picked = await showDatePicker(
            context: context,
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: initialDate,
            firstDate: firstDate ?? DateTime.now(),
            lastDate:
                lastDate ??
                DateTime.now().add(
                  const Duration(
                    days: 365 * 30,
                  ),
                ),
            selectableDayPredicate: selectableDayPredicate,
          );

          if (picked != null) {
            if (onChanged != null) {
              // ignore: prefer_null_aware_method_calls
              onChanged!(picked);
            }
          }
        }
      },
    );
  }
}
