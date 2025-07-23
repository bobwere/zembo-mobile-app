import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zembo_agent_app/application/battery_request/battery_request_cubit.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/router/routes.dart';
import 'package:zembo_agent_app/presentation/widgets/bar.dart';
import 'package:zembo_agent_app/presentation/widgets/battery_request_tile.dart';
import 'package:zembo_agent_app/presentation/widgets/empty_state_card.dart';
import 'package:zembo_agent_app/presentation/widgets/snackbar_widget.dart';

class RequestDeliveryPage extends StatefulWidget {
  const RequestDeliveryPage({super.key});

  @override
  State<RequestDeliveryPage> createState() => _RequestDeliveryPageState();
}

class _RequestDeliveryPageState extends State<RequestDeliveryPage> {
  String numberOfbatteries = '';

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return Scaffold(
      body: BlocListener<BatteryRequestCubit, BatteryRequestState>(
        listener: (context, state) {
          if (state.batteryRequestStatus == AppStatus.success) {
            showSnackBar(
              context,
              state: SnackbarState.success,
              message: 'Battery request added successfully',
            );
            context.pop();
          }

          if (state.batteryRequestStatus == AppStatus.failure) {
            showSnackBar(
              context,
              message: state.batteryRequestError ?? 'An error occurred',
            );
          }
        },
        child: BlocBuilder<BatteryRequestCubit, BatteryRequestState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  const Bar(title: 'Battery Requests'),
                  SizedBox(height: ui.scaleHeightFactor(14)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ui.scaleWidthFactor(16),
                      ),
                      child: Text(
                        'Track battery requests status and sync automatically when back online.',
                        textScaler: TextScaler.linear(ui.textScaleFactor),
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: ui.scaleHeightFactor(20)),
                  if (state.batteryRequests!.isEmpty)
                    const EmptyStateCard(
                      title: 'No battery requests found',
                      description:
                          'You will find your battery requests here after you have requested for delivery.',
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.batteryRequests!.length,
                        itemBuilder: (context, index) {
                          final batteryRequest = state.batteryRequests![index];

                          return BatteryRequestTile(
                            batteryRequest: batteryRequest,
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(addBatteryRequestRoute);
        },
        child: const Icon(LineAwesomeIcons.plus_solid),
      ),
    );
  }
}
