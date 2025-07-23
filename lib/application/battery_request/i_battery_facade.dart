import 'package:zembo_agent_app/domain/battery_request/battery_request.dart';

abstract class IBatteryRequestFacade {
  Future<List<BatteryRequest>> getBatteryRequests();
  Future<void> createBatteryRequest({
    required int swapperId,
    required int numberOfBatteries,
    required int destination,
  });
}
