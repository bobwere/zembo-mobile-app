import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/application/shift/i_shift_facade.dart';
import 'package:zembo_agent_app/domain/shift_history/shift_history.dart';

@LazySingleton(as: IShiftFacade)
class ShiftFacade implements IShiftFacade {
  ShiftFacade(this._dio);

  final Dio _dio;

  @override
  Future<ShiftHistory?> fetchActiveShift({required int userId}) async {
    try {
      final res = await _dio.get<dynamic>('/shift-history/active');

      if (res.data['data'] == null) {
        return null;
      }

      final results = Map<String, dynamic>.from(
        (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
      );

      final shiftHistory = ShiftHistory.fromJson(results);

      return shiftHistory;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ShiftHistory> startShift({
    required int userId,
    required String startTime,
    required String startLocationLng,
    required String startLocationLat,
    required String startPhotoUrl,
  }) async {
    try {
      final res = await _dio.post<dynamic>(
        '/shift-history',
        data: {
          'user_id': userId,
          'start_time': startTime,
          'start_location_lng': startLocationLng,
          'start_location_lat': startLocationLat,
          'start_photo_url': startPhotoUrl,
        },
      );

      final results = Map<String, dynamic>.from(
        (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
      );

      final shiftHistory = ShiftHistory.fromJson(results);

      return shiftHistory;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ShiftHistory> endShift({
    required int id,
    String? endTime,
    String? endLocationLng,
    String? endLocationLat,
    String? endPhotoUrl,
  }) async {
    try {
      final res = await _dio.patch<dynamic>(
        '/shift-history/$id',
        data: {
          'end_time': endTime,
          'end_location_lng': endLocationLng,
          'end_location_lat': endLocationLat,
          'end_photo_url': endPhotoUrl,
        },
      );

      final results = Map<String, dynamic>.from(
        (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
      );

      final shiftHistory = ShiftHistory.fromJson(results);

      return shiftHistory;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ShiftHistory>> fetchAllShiftHistory() async {
    try {
      final res = await _dio.get<dynamic>('/shift-history/user');

      final results = List<Map<String, dynamic>>.from(
        (res.data as Map<String, dynamic>)['data'] as Iterable,
      );

      final shiftHistory = <ShiftHistory>[];
      for (final json in results) {
        final shift = ShiftHistory.fromJson(json);
        shiftHistory.add(shift);
      }

      return shiftHistory;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ShiftHistory>> fetchCurrentDaysShiftHistory() async {
    try {
      final res = await _dio.get<dynamic>('/shift-history/today');

      final results = List<Map<String, dynamic>>.from(
        (res.data as Map<String, dynamic>)['data'] as Iterable,
      );

      final shiftHistory = <ShiftHistory>[];
      for (final json in results) {
        final shift = ShiftHistory.fromJson(json);
        shiftHistory.add(shift);
      }

      return shiftHistory;
    } catch (e) {
      rethrow;
    }
  }
}
