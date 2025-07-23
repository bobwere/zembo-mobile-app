// ignore_for_file: use_build_context_synchronously, document_ignores
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/application/notification/notification_cubit.dart';
import 'package:zembo_agent_app/application/shift/shift_cubit.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/router/routes.dart';
import 'package:zembo_agent_app/presentation/widgets/app_button.dart';
import 'package:zembo_agent_app/presentation/widgets/app_loader.dart';
import 'package:zembo_agent_app/presentation/widgets/digital_clock_widget.dart';
import 'package:zembo_agent_app/presentation/widgets/selfie_picker.dart';
import 'package:zembo_agent_app/presentation/widgets/shift_history_tile.dart';
import 'package:zembo_agent_app/presentation/widgets/snackbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return BlocBuilder<ShiftCubit, ShiftState>(
      builder: (context, shiftState) {
        final isStartLoading = context.select<ShiftCubit, bool>(
          (b) => b.state.startShiftStatus == AppStatus.submitting,
        );
        final isEndLoading = context.select<ShiftCubit, bool>(
          (b) => b.state.endShiftStatus == AppStatus.submitting,
        );

        final isLoading =
            shiftState.fetchHasActiveShiftStatus == AppStatus.submitting ||
            shiftState.fetchCurrentDaysShiftHistoryStatus ==
                AppStatus.submitting ||
            shiftState.fetchAllShiftHistoryStatus == AppStatus.submitting ||
            shiftState.startShiftStatus == AppStatus.submitting ||
            shiftState.endShiftStatus == AppStatus.submitting ||
            shiftState.geoLocationStatus == AppStatus.submitting;

        return BlocListener<ShiftCubit, ShiftState>(
          listenWhen: (previous, current) =>
              previous.startShiftStatus != current.startShiftStatus ||
              previous.endShiftStatus != current.endShiftStatus,
          listener: (context, state) {
            if (state.startShiftStatus == AppStatus.success) {
              showSnackBar(
                context,
                message: 'Shift started successfully',
                state: SnackbarState.success,
              );
            }
            if (state.endShiftStatus == AppStatus.success) {
              showSnackBar(
                context,
                message: 'Shift ended successfully',
                state: SnackbarState.success,
              );
            }
          },
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              return Scaffold(
                body: Column(
                  children: [
                    Container(
                      height: ui.scaleHeightFactor(350),
                      padding: EdgeInsets.symmetric(
                        horizontal: ui.scaleWidthFactor(12),
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: ui.theme.colorScheme.primary.withOpacity(0.8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/png/abstract.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: ui.scaleHeightFactor(40)),
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
                                      color: Colors.white,
                                    ),
                                  ),
                                  BlocBuilder<
                                    NotificationCubit,
                                    NotificationState
                                  >(
                                    builder: (context, state) {
                                      final notifications = state.notifications!
                                          .where((i) => !i.isRead!)
                                          .toList();
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
                                                notifications.length.toString(),
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
                                context.goNamed(notificationRoute);
                              },
                            ),
                          ),
                          Align(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: ui.scaleWidthFactor(16),
                              ),
                              child: Text(
                                'Hi ${authState.user?.username ?? ''}!',
                                textScaler: TextScaler.linear(
                                  ui.textScaleFactor,
                                ),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      height: 1,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(height: ui.scaleHeightFactor(10)),
                          // Digital Clock Widget
                          const DigitalClockWidget(),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                horizontal: ui.scaleWidthFactor(32),
                                vertical: ui.scaleHeightFactor(32),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  ui.scaleWidthFactor(10),
                                ),
                              ),
                              child: isLoading
                                  ? const Center(
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: AppLoader(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          shiftState.shiftMessaging ?? '',
                                          textScaler: TextScaler.linear(
                                            ui.textScaleFactor,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(
                                                height: 1,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Colors.grey.shade600,
                                              ),
                                        ),
                                        if (shiftState.showStartShiftButton! ||
                                            shiftState.showEndShiftButton!) ...[
                                          SizedBox(
                                            height: ui.scaleHeightFactor(20),
                                          ),
                                          AppButton(
                                            width: ui.scaleWidthFactor(160),
                                            isFullWidth: false,
                                            isLoading:
                                                isStartLoading || isEndLoading,
                                            onPressed: () async {
                                              Position? position;
                                              File? image;
                                              try {
                                                //
                                                final isWithinGeofenceRadius =
                                                    await context
                                                        .read<ShiftCubit>()
                                                        .isWithinGeofenceRadius();

                                                if (!(isWithinGeofenceRadius['isWithinGeofenceRadius']
                                                    as bool)) {
                                                  showSnackBar(
                                                    context,
                                                    message:
                                                        'You are not within the 50 meters geofence radius of your work station to start your shift.',
                                                  );
                                                  return;
                                                }

                                                position =
                                                    isWithinGeofenceRadius['currentPosition']
                                                        as Position;

                                                // navigate to take photo screen
                                                image = await showImagePicker(
                                                  context,
                                                );

                                                if (image == null) {
                                                  showSnackBar(
                                                    context,
                                                    message:
                                                        'Take a selfie at your station to proceed',
                                                  );
                                                  return;
                                                }
                                              } catch (e) {
                                                showSnackBar(
                                                  context,
                                                  message: e.toString(),
                                                );
                                                return;
                                              }

                                              if (shiftState
                                                  .showStartShiftButton!) {
                                                unawaited(
                                                  context
                                                      .read<ShiftCubit>()
                                                      .startShift(
                                                        userId:
                                                            authState
                                                                .user
                                                                ?.id ??
                                                            0,
                                                        startTime: DateTime.now()
                                                            .toIso8601String(),
                                                        startLocationLng:
                                                            position.longitude
                                                                .toString(),
                                                        startLocationLat:
                                                            position.latitude
                                                                .toString(),
                                                        startPhotoUrl:
                                                            image.path,
                                                      ),
                                                );
                                                //
                                              }

                                              if (shiftState
                                                  .showEndShiftButton!) {
                                                unawaited(
                                                  context
                                                      .read<ShiftCubit>()
                                                      .endShift(
                                                        id:
                                                            shiftState
                                                                .activeShift
                                                                ?.id ??
                                                            0,
                                                        userId:
                                                            authState
                                                                .user
                                                                ?.id ??
                                                            0,
                                                        endTime: DateTime.now()
                                                            .toIso8601String(),
                                                        endLocationLng: position
                                                            .longitude
                                                            .toString(),
                                                        endLocationLat: position
                                                            .latitude
                                                            .toString(),
                                                        endPhotoUrl: image.path,
                                                      ),
                                                );
                                              }
                                            },
                                            text:
                                                shiftState.showStartShiftButton!
                                                ? 'Start Shift'
                                                : 'End Shift',
                                          ),
                                        ],
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: ui.scaleHeightFactor(16)),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ui.scaleWidthFactor(16),
                                ),
                                child: Text(
                                  'Today',
                                  textScaler: TextScaler.linear(
                                    ui.textScaleFactor,
                                  ),
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ),
                            SizedBox(height: ui.scaleHeightFactor(16)),
                            SizedBox(
                              height: ui.scaleHeightFactor(80),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                padding: EdgeInsets.symmetric(
                                  horizontal: ui.scaleWidthFactor(16),
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      right: ui.scaleWidthFactor(16),
                                    ),
                                    width: ui.scaleWidthFactor(190),
                                    height: ui.scaleHeightFactor(80),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        250,
                                        206,
                                        175,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        ui.scaleWidthFactor(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: ui.scaleWidthFactor(20),
                                            backgroundColor: Colors.white,
                                            child: const Icon(
                                              LineAwesomeIcons.briefcase_solid,
                                              color: Colors.orange,
                                            ),
                                          ),
                                          SizedBox(
                                            width: ui.scaleWidthFactor(10),
                                          ),
                                          const Flexible(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('9:00AM-10:00AM'),
                                                Text('On Shift'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: ui.scaleHeightFactor(16)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: ui.scaleWidthFactor(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Shift History',
                                      textScaler: TextScaler.linear(
                                        ui.textScaleFactor,
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'View All',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: ui.scaleHeightFactor(16)),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              padding: EdgeInsets.symmetric(
                                horizontal: ui.scaleWidthFactor(16),
                              ),
                              itemBuilder: (context, index) {
                                return const ShiftHistoryTile();
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
        );
      },
    );
  }
}
