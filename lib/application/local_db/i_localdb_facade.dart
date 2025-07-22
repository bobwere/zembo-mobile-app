import 'package:zembo_agent_app/domain/shift_history/shift_history.dart';
import 'package:zembo_agent_app/domain/user/user.dart';

abstract class ILocalDBFacade {
  Future<ShiftHistory?> fetchActiveShift({required int userId});
  Future<List<ShiftHistory>> fetchCurrentDaysShiftHistory();
  Future<List<ShiftHistory>> fetchAllShiftHistory();
  Future<void> createShiftHistory(ShiftHistory shiftHistory);
  Future<void> updateShiftHistory(ShiftHistory shiftHistory);
  Future<void> saveUser(User user);
  Future<User> getUser();
}
