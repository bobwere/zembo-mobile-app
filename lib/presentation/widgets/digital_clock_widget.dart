import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({
    super.key,
    this.textStyle,
    this.textColor,
    this.padding,
    this.alignment = Alignment.center,
  });

  final TextStyle? textStyle;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final Alignment alignment;

  @override
  State<DigitalClockWidget> createState() => _DigitalClockWidgetState();
}

class _DigitalClockWidgetState extends State<DigitalClockWidget> {
  late Stream<DateTime> _timeStream;

  @override
  void initState() {
    super.initState();
    _timeStream = Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now(),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('EEEE d, MMMM y h:mm a');
    return formatter
        .format(dateTime)
        .toLowerCase()
        .replaceAll('am', 'AM')
        .replaceAll('pm', 'PM')
        .replaceAll('monday', 'Mon')
        .replaceAll('tuesday', 'Tue')
        .replaceAll('wednesday', 'Wed')
        .replaceAll('thursday', 'Thurs')
        .replaceAll('friday', 'Fri')
        .replaceAll('saturday', 'Sat')
        .replaceAll('sunday', 'Sun')
        .replaceAll('january', 'January')
        .replaceAll('february', 'February')
        .replaceAll('march', 'March')
        .replaceAll('april', 'April')
        .replaceAll('may', 'May')
        .replaceAll('june', 'June')
        .replaceAll('july', 'July')
        .replaceAll('august', 'August')
        .replaceAll('september', 'September')
        .replaceAll('october', 'October')
        .replaceAll('november', 'November')
        .replaceAll('december', 'December');
  }

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);

    return StreamBuilder<DateTime>(
      stream: _timeStream,
      builder: (context, snapshot) {
        final now = snapshot.data ?? DateTime.now();
        final formattedTime = _formatDateTime(now);

        return Align(
          alignment: widget.alignment,
          child: Padding(
            padding:
                widget.padding ??
                EdgeInsets.symmetric(
                  horizontal: ui.scaleWidthFactor(16),
                ),
            child: Text(
              formattedTime,
              textScaler: TextScaler.linear(ui.textScaleFactor),
              style:
                  widget.textStyle ??
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: widget.textColor ?? Colors.white.withOpacity(0.9),
                  ),
            ),
          ),
        );
      },
    );
  }
}
