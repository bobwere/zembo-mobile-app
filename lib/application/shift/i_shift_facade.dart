import 'package:zembo_agent_app/domain/shift_history/shift_history.dart';

abstract class IShiftFacade {
  Future<ShiftHistory?> fetchActiveShift({required int userId});
  Future<List<ShiftHistory>> fetchCurrentDaysShiftHistory();
  Future<List<ShiftHistory>> fetchAllShiftHistory();
  Future<ShiftHistory> startShift({
    required int userId,
    required String startTime,
    required String startLocationLng,
    required String startLocationLat,
    required String startPhotoUrl,
  });
  Future<ShiftHistory> endShift({
    required int id,
    String? endTime,
    String? endLocationLng,
    String? endLocationLat,
    String? endPhotoUrl,
  });
}
