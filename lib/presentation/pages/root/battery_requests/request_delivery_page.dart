import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/application/battery_request/battery_request_cubit.dart';
import 'package:zembo_agent_app/application/notification/notification_cubit.dart';
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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        final isRider = authState.user?.role == 'rider';

        return Scaffold(
          body: BlocListener<BatteryRequestCubit, BatteryRequestState>(
            listener: (context, state) {
              if (state.syncRiderBatteryRequestsStatus == AppStatus.success) {
                showSnackBar(
                  context,
                  state: SnackbarState.success,
                  message: 'Battery delivery request updated successfully',
                );
              }

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
                      Bar(
                        title: isRider
                            ? 'Battery Delivery Requests'
                            : 'Battery Requests',
                        widgets: [
                          if (isRider)
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Stack(
                                  children: [
                                    SizedBox(
                                      height: ui.scaleWidthFactor(35),
                                      width: ui.scaleWidthFactor(35),
                                      child: SvgPicture.asset(
                                        'assets/images/svg/notification.svg',
                                        color: ui.theme.colorScheme.primary,
                                      ),
                                    ),
                                    BlocBuilder<
                                      NotificationCubit,
                                      NotificationState
                                    >(
                                      builder: (context, state) {
                                        final notifications =
                                            state.notifications
                                                ?.where(
                                                  (i) => !(i.isRead ?? false),
                                                )
                                                .toList() ??
                                            [];
                                        if (notifications.isEmpty) {
                                          return const SizedBox();
                                        }

                                        return Positioned(
                                          bottom: 0,
                                          left: 0,
                                          child: Container(
                                            height: ui.scaleWidthFactor(20),
                                            width: ui.scaleWidthFactor(20),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            padding: EdgeInsets.all(
                                              ui.scaleWidthFactor(2),
                                            ),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                      255,
                                                      255,
                                                      119,
                                                      110,
                                                    ),
                                                    Color.fromARGB(
                                                      255,
                                                      255,
                                                      141,
                                                      133,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              padding: EdgeInsets.all(
                                                ui.scaleWidthFactor(4),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  notifications.length
                                                      .toString(),
                                                  textScaler: TextScaler.linear(
                                                    ui.textScaleFactor,
                                                  ),
                                                  style: ui
                                                      .theme
                                                      .textTheme
                                                      .headlineMedium
                                                      ?.copyWith(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  context.goNamed(riderNotificationRoute);
                                },
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: ui.scaleHeightFactor(14)),
                      if (!isRider)
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
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            if (isRider) {
                              unawaited(
                                context
                                    .read<BatteryRequestCubit>()
                                    .getRiderBatteryDeliveryRequests(
                                      context.read<AuthCubit>().state.user!.id!,
                                    ),
                              );
                            } else {
                              unawaited(
                                context
                                    .read<BatteryRequestCubit>()
                                    .getBatteryRequests(
                                      context.read<AuthCubit>().state.user!.id!,
                                    ),
                              );
                            }
                          },
                          child: ListView(
                            children: [
                              if (!isRider &&
                                  (state.batteryRequests?.isEmpty ?? true))
                                const EmptyStateCard(
                                  title: 'No battery requests found',
                                  description:
                                      'You will find your battery requests here after you have requested for delivery.',
                                )
                              else if (isRider &&
                                  (state.riderBatteryRequests?.isEmpty ?? true))
                                const EmptyStateCard(
                                  title: 'No Delivery Requests Yet!',
                                  description:
                                      'You will find your battery delivery requests here',
                                )
                              else if (!isRider &&
                                  state.batteryRequests != null)
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.batteryRequests!.length,
                                  itemBuilder: (context, index) {
                                    final batteryRequest =
                                        state.batteryRequests![index];

                                    return BatteryRequestTile(
                                      batteryRequest: batteryRequest,
                                    );
                                  },
                                )
                              else if (isRider &&
                                  state.riderBatteryRequests != null)
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.riderBatteryRequests!.length,
                                  itemBuilder: (context, index) {
                                    final batteryRequest =
                                        state.riderBatteryRequests![index];

                                    return BatteryRequestTile(
                                      batteryRequest: batteryRequest,
                                      isRider: true,
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          floatingActionButton: isRider
              ? null
              : FloatingActionButton(
                  onPressed: () {
                    context.goNamed(addBatteryRequestRoute);
                  },
                  child: const Icon(LineAwesomeIcons.plus_solid),
                ),
        );
      },
    );
  }
}
