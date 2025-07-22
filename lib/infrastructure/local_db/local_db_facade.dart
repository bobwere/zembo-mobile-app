import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/application/local_db/i_localdb_facade.dart';
import 'package:zembo_agent_app/domain/shift_history/shift_history.dart';
import 'package:zembo_agent_app/domain/user/user.dart';

@LazySingleton(as: ILocalDBFacade)
class LocalDBFacade implements ILocalDBFacade {
  Future<BoxCollection> initialize() async {
    return BoxCollection.open(
      'ZemboDB',
      {'shift_history', 'user'},
    );
  }

  @override
  Future<void> createShiftHistory(ShiftHistory shiftHistory) async {
    final collection = await initialize();
    final shiftHistoryBox = await collection
        .openBox<List<Map<dynamic, dynamic>>>(
          'shift_history',
        );

    final dataList =
        (await shiftHistoryBox.get('shift_history'))
                  as List<Map<String, dynamic>>? ??
              <Map<String, dynamic>>[]
          ..add(shiftHistory.toJson());

    await shiftHistoryBox.put('shift_history', dataList);
  }

  @override
  Future<ShiftHistory?> fetchActiveShift({required int userId}) async {
    final shiftHistoryList = await fetchAllShiftHistory();
    final shift = shiftHistoryList.firstWhere(
      (shiftHistory) =>
          shiftHistory.startTime != null && shiftHistory.endTime == null,
      orElse: ShiftHistory.initial,
    );

    if (shift == ShiftHistory.initial()) {
      return null;
    }

    return shift;
  }

  @override
  Future<List<ShiftHistory>> fetchAllShiftHistory() async {
    final collection = await initialize();
    final shiftHistoryBox = await collection
        .openBox<List<Map<dynamic, dynamic>>>(
          'shift_history',
        );

    final shiftHistoryList = <ShiftHistory>[];

    final dataList =
        (await shiftHistoryBox.get('shift_history'))
            as List<Map<String, dynamic>>? ??
        <Map<String, dynamic>>[];

    for (final data in dataList) {
      final shiftHistory = ShiftHistory.fromJson(data);
      shiftHistoryList.add(shiftHistory);
    }

    return shiftHistoryList;
  }

  @override
  Future<List<ShiftHistory>> fetchCurrentDaysShiftHistory() async {
    final shiftHistoryList = await fetchAllShiftHistory();
    final shifts = shiftHistoryList.where((shiftHistory) {
      final createdDate = DateTime.parse(shiftHistory.createdAt!);
      final today = DateTime.now();
      return createdDate.year == today.year &&
          createdDate.month == today.month &&
          createdDate.day == today.day;
    }).toList();

    return shifts;
  }

  @override
  Future<User> getUser() async {
    final collection = await initialize();
    final shiftHistoryBox = await collection.openBox<Map<dynamic, dynamic>>(
      'user',
    );

    final user = await shiftHistoryBox.get('user');
    if (user == null) {
      return User.initial();
    }

    return User.fromJson(user as Map<String, dynamic>);
  }

  @override
  Future<void> saveUser(User user) async {
    final collection = await initialize();
    final shiftHistoryBox = await collection.openBox<Map<dynamic, dynamic>>(
      'user',
    );

    await shiftHistoryBox.put('user', user.toJson());
  }

  @override
  Future<void> updateShiftHistory(ShiftHistory shiftHistory) async {
    final collection = await initialize();
    final shiftHistoryBox = await collection
        .openBox<List<Map<dynamic, dynamic>>>(
          'shift_history',
        );

    final dataList =
        (await shiftHistoryBox.get('shift_history'))
                  as List<Map<String, dynamic>>? ??
              <Map<String, dynamic>>[]
          ..add(shiftHistory.toJson());

    final index = dataList.indexWhere((data) => data['id'] == shiftHistory.id);

    dataList[index] = shiftHistory.toJson();

    await shiftHistoryBox.put('shift_history', dataList);
  }
}
