import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDigitalClock extends StatefulWidget {
  const CustomDigitalClock({super.key});

  @override
  State<CustomDigitalClock> createState() => _CustomDigitalClockState();
}

class _CustomDigitalClockState extends State<CustomDigitalClock> {
  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    final now = DateTime.now();

    // Format: "thurs 19 Jan 2025 5:56PM"
    final dayName = DateFormat(
      'EEEE',
    ).format(now).toLowerCase().substring(0, 5);
    final dayNumber = DateFormat('d').format(now);
    final monthName = DateFormat('MMM').format(now);
    final year = DateFormat('y').format(now);
    final time = DateFormat('h:mm').format(now);
    final amPm = DateFormat('a').format(now);

    final formattedTime = '$dayName $dayNumber $monthName $year $time$amPm';

    setState(() {
      _currentTime = formattedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
      child: Text(
        _currentTime,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
          fontSize: 16,
        ),
      ),
    );
  }
}
