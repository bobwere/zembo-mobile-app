import 'dart:developer';

import 'package:cloudinary/cloudinary.dart';
import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/application/battery_request/i_battery_facade.dart';
import 'package:zembo_agent_app/domain/battery_request/battery_request.dart';

@LazySingleton(as: IBatteryRequestFacade)
class BatteryRequestFacade implements IBatteryRequestFacade {
  BatteryRequestFacade(this._dio);

  final Dio _dio;

  @override
  Future<void> createBatteryRequest({
    required int swapperId,
    required int numberOfBatteries,
    required int destination,
  }) async {
    try {
      final res = await _dio.post<dynamic>(
        '/battery-request',
        data: {
          'swapper_id': swapperId,
          'number_of_batteries': numberOfBatteries,
          'destination': destination,
        },
      );

      log(res.data.toString());

      return;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BatteryRequest>> getBatteryRequests() async {
    try {
      final res = await _dio.get<dynamic>(
        '/battery-request',
      );

      final results = List<Map<String, dynamic>>.from(
        (res.data as Map<String, dynamic>)['data'] as Iterable,
      );

      final requests = <BatteryRequest>[];
      for (final json in results) {
        final request = BatteryRequest.fromJson(json);
        requests.add(request);
      }

      return requests;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateBatteryRequestStatus(
    int requestId,
    String status,
  ) async {
    try {
      await _dio.patch<dynamic>(
        '/battery-request/$requestId',
        data: {
          'status': status,
        },
      );

      return;
    } catch (e) {
      rethrow;
    }
  }
}
