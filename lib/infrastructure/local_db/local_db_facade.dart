// ignore_for_file: lines_longer_than_80_chars, unintended_html_in_doc_comment, cascade_invocations, inference_failure_on_function_invocation, document_ignores

import 'dart:developer';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/application/local_db/i_localdb_facade.dart';
import 'package:zembo_agent_app/domain/battery_request/battery_request.dart';
import 'package:zembo_agent_app/domain/shift_history/shift_history.dart';
import 'package:zembo_agent_app/domain/user/user.dart';

@LazySingleton(as: ILocalDBFacade)
class LocalDBFacade implements ILocalDBFacade {
  Future<BoxCollection> initialize() async {
    return BoxCollection.open(
      'ZemboDB',
      {'shift_history', 'user', 'battery_request'},
    );
  }

  /// Helper method to recursively convert Map<dynamic, dynamic> to Map<String, dynamic>
  Map<String, dynamic> _convertMap(Map<dynamic, dynamic> source) {
    final result = <String, dynamic>{};
    source.forEach((key, value) {
      final stringKey = key.toString();
      if (value is Map<dynamic, dynamic>) {
        result[stringKey] = _convertMap(value);
      } else if (value is List) {
        result[stringKey] = _convertList(value);
      } else {
        result[stringKey] = value;
      }
    });
    return result;
  }

  /// Helper method to recursively convert List elements
  List<dynamic> _convertList(List<dynamic> source) {
    return source.map((item) {
      if (item is Map<dynamic, dynamic>) {
        return _convertMap(item);
      } else if (item is List) {
        return _convertList(item);
      } else {
        return item;
      }
    }).toList();
  }

  @override
  Future<void> createShiftHistory(ShiftHistory shiftHistory) async {
    final collection = await initialize();
    final shiftHistoryBox = await collection.openBox('shift_history');

    final dataList =
        (await shiftHistoryBox.get('shift_history') as List<dynamic>?)
            ?.cast<Map<dynamic, dynamic>>()
            .map(_convertMap)
            .toList() ??
        <Map<String, dynamic>>[];

    dataList.add(shiftHistory.toJson());

    await shiftHistoryBox.put('shift_history', dataList);
  }

  @override
  Future<ShiftHistory?> fetchActiveShift({required int userId}) async {
    final shiftHistoryList = await fetchAllShiftHistory();
    final shift = shiftHistoryList.firstWhere(
      (shiftHistory) =>
          shiftHistory.startTime != null &&
          (shiftHistory.endTime == null || shiftHistory.endTime == ''),
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
    final shiftHistoryBox = await collection.openBox('shift_history');

    final shiftHistoryList = <ShiftHistory>[];

    final dataList =
        (await shiftHistoryBox.get('shift_history') as List<dynamic>?)
            ?.cast<Map<dynamic, dynamic>>()
            .map(_convertMap)
            .toList() ??
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
    final userBox = await collection.openBox('user');

    final user = await userBox.get('user') as Map<dynamic, dynamic>?;
    if (user == null) {
      return User.initial();
    }

    final userMap = _convertMap(user);
    final savedUser = User.fromJson(userMap);
    return savedUser;
  }

  @override
  Future<void> saveUser(User user) async {
    final collection = await initialize();
    final userBox = await collection.openBox('user');

    final json = user.toJson();

    await userBox.put('user', json);
  }

  @override
  Future<void> updateShiftHistory(int id, ShiftHistory shiftHistory) async {
    final collection = await initialize();
    final shiftHistoryBox = await collection.openBox('shift_history');

    final dataList =
        (await shiftHistoryBox.get('shift_history') as List<dynamic>?)
            ?.cast<Map<dynamic, dynamic>>()
            .map(_convertMap)
            .toList() ??
        <Map<String, dynamic>>[];

    final index = dataList.indexWhere((data) => data['id'] == id);
    if (index >= 0) {
      dataList[index] = shiftHistory.toJson();
    } else {
      dataList.add(shiftHistory.toJson());
    }

    await shiftHistoryBox.put('shift_history', dataList);
  }

  @override
  Future<void> batchUpdateLocalShiftHistory(
    List<ShiftHistory> shiftHistory,
  ) async {
    try {
      final collection = await initialize();
      final shiftHistoryBox = await collection.openBox('shift_history');

      final data = shiftHistory.map((h) => h.toJson()).toList();

      await shiftHistoryBox.put('shift_history', data);
    } catch (e) {
      log(e.toString());
      //
    }
  }

  @override
  Future<void> batchUpdateBatteryRequest(
    List<BatteryRequest> batteryRequests,
  ) async {
    final collection = await initialize();
    final batteryRequestBox = await collection.openBox('battery_request');

    final data = batteryRequests.map((b) => b.toJson()).toList();

    await batteryRequestBox.put('battery_request', data);
  }

  @override
  Future<List<BatteryRequest>> fetchBatteryRequests() async {
    final collection = await initialize();
    final batteryRequestBox = await collection.openBox('battery_request');

    final batteryRequestList = <BatteryRequest>[];

    final dataList =
        (await batteryRequestBox.get('battery_request') as List<dynamic>?)
            ?.cast<Map<dynamic, dynamic>>()
            .map(_convertMap)
            .toList() ??
        <Map<String, dynamic>>[];

    for (final data in dataList) {
      final batteryRequest = BatteryRequest.fromJson(data);
      batteryRequestList.add(batteryRequest);
    }

    return batteryRequestList;
  }

  @override
  Future<void> saveBatteryRequest(BatteryRequest batteryRequest) async {
    final collection = await initialize();
    final batteryRequestBox = await collection.openBox('battery_request');

    final dataList =
        (await batteryRequestBox.get('battery_request') as List<dynamic>?)
            ?.cast<Map<dynamic, dynamic>>()
            .map(_convertMap)
            .toList() ??
        <Map<String, dynamic>>[];

    dataList.add(batteryRequest.toJson());

    await batteryRequestBox.put('battery_request', dataList);
  }
}
