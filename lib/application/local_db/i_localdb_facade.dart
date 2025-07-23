import 'package:zembo_agent_app/domain/battery_request/battery_request.dart';
import 'package:zembo_agent_app/domain/shift_history/shift_history.dart';
import 'package:zembo_agent_app/domain/user/user.dart';

abstract class ILocalDBFacade {
  // shifts
  Future<ShiftHistory?> fetchActiveShift({required int userId});
  Future<List<ShiftHistory>> fetchCurrentDaysShiftHistory();
  Future<List<ShiftHistory>> fetchAllShiftHistory();
  Future<void> batchUpdateLocalShiftHistory(List<ShiftHistory> shiftHistory);
  Future<void> createShiftHistory(ShiftHistory shiftHistory);
  Future<void> updateShiftHistory(int id, ShiftHistory shiftHistory);
  Future<void> saveUser(User user);
  Future<User> getUser();

  // battery request
  Future<void> saveBatteryRequest(BatteryRequest batteryRequest);
  Future<List<BatteryRequest>> fetchBatteryRequests();
  Future<void> batchUpdateBatteryRequest(List<BatteryRequest> batteryRequests);
}
