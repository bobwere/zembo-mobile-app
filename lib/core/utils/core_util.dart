import 'package:jiffy/jiffy.dart';

Jiffy getCurrentShiftTime(String endTime) {
  final now = Jiffy.now();
  final originalTime = Jiffy.parse(endTime);
  final updatedEndTime = Jiffy.parseFromDateTime(
    DateTime(
      now.year,
      now.month,
      now.date,
      originalTime.hour,
      originalTime.minute,
      originalTime.second,
    ),
  );

  return updatedEndTime;
}
