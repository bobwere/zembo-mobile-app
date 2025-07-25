// ignore_for_file: avoid_catches_without_on_clauses, deprecated_member_use, document_ignores, lines_longer_than_80_chars, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/application/battery_request/battery_request_cubit.dart';
import 'package:zembo_agent_app/application/connectivity/connectivity_cubit.dart';
import 'package:zembo_agent_app/application/notification/notification_cubit.dart';
import 'package:zembo_agent_app/application/shift/shift_cubit.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/infrastructure/notification/notification_service.dart';
import 'package:zembo_agent_app/presentation/widgets/snackbar_widget.dart';

class ScaffoldWithNestedNavigation extends StatefulWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(
         key: key ?? const ValueKey('ScaffoldWithNestedNavigation'),
       );
  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends State<ScaffoldWithNestedNavigation> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.navigationShell.currentIndex;
    initializeNotifications();
  }

  Future<void> initializeNotifications() async {
    try {
      if (mounted) {
        await NotificationService.instance.initialize(context);
        await NotificationService.instance.deleteToken();

        final token = await NotificationService.instance.getDeviceToken();
        final userId = context.read<AuthCubit>().state.user?.id ?? 0;
        await context.read<NotificationCubit>().registerDeviceToken(
          userId,
          token ?? '',
        );
      }
    } catch (e) {
      //
    }
  }

  @override
  void didUpdateWidget(ScaffoldWithNestedNavigation oldWidget) {
    if (oldWidget.navigationShell != widget.navigationShell) {
      pageIndex = widget.navigationShell.currentIndex;
    }
    super.didUpdateWidget(oldWidget);
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return BlocListener<ShiftCubit, ShiftState>(
      listenWhen: (previous, current) =>
          previous.syncLocalToRemoteShiftHistoryStatus !=
          current.syncLocalToRemoteShiftHistoryStatus,
      listener: (context, state) {
        if (state.syncLocalToRemoteShiftHistoryStatus == AppStatus.submitting) {
          showSnackBar(
            context,
            state: SnackbarState.info,
            message: 'Syncing local shift history with remote...',
          );
        }

        if (state.syncLocalToRemoteShiftHistoryStatus == AppStatus.failure) {
          showSnackBar(
            context,
            message:
                'Failed to sync local shift history with remote server successfully',
          );
        }

        if (state.syncLocalToRemoteShiftHistoryStatus == AppStatus.success) {
          showSnackBar(
            context,
            state: SnackbarState.success,
            message:
                'Local shift history synced with remote server successfully',
          );
        }
      },
      child: BlocListener<BatteryRequestCubit, BatteryRequestState>(
        listenWhen: (previous, current) =>
            previous.syncBatteryRequestsStatus !=
            current.syncBatteryRequestsStatus,
        listener: (context, state) {
          if (state.syncBatteryRequestsStatus == AppStatus.submitting) {
            showSnackBar(
              context,
              state: SnackbarState.info,
              message: 'Syncing local battery requests with remote...',
            );
          }

          if (state.syncBatteryRequestsStatus == AppStatus.failure) {
            showSnackBar(
              context,
              message: 'Failed to sync battery requests',
            );
          }

          if (state.syncBatteryRequestsStatus == AppStatus.success) {
            showSnackBar(
              context,
              state: SnackbarState.success,
              message: 'Battery requests synced successfully',
            );
          }
        },
        child: BlocListener<ConnectivityCubit, ConnectivityState>(
          listener: (context, state) {
            if (!state.isConnected!) {
              showSnackBar(
                context,
                message: 'No internet connection',
              );
            }

            if (state.isConnected!) {
              showSnackBar(
                context,
                message: 'Internet connection restored',
                state: SnackbarState.success,
              );
              context.read<ShiftCubit>().syncLocalToRemoteShiftHistory(
                context.read<AuthCubit>().state.user!.id!,
              );
              context
                  .read<BatteryRequestCubit>()
                  .syncLocalToRemoteBatteryRequest(
                    context.read<AuthCubit>().state.user!.id!,
                  );
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: widget.navigationShell,
            bottomNavigationBar: SafeArea(
              child: Container(
                height: Platform.isIOS ? 90 : 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.09),
                      offset: const Offset(0, -1),
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ...<BottomNavigationItem>[
                        BottomNavigationItem.home,
                        BottomNavigationItem.batteryRequest,
                        BottomNavigationItem.profile,
                      ].map(
                        (item) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            _goBranch(item.idx);

                            setState(() {
                              pageIndex = item.idx;
                            });
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (pageIndex == item.idx)
                                  Icon(
                                    item.icon,
                                    size: 20,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                if (pageIndex != item.idx)
                                  Icon(
                                    item.icon,
                                    size: 20,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary.withOpacity(0.3),
                                  ),
                                const SizedBox(height: 4),
                                Text(
                                  item.name,
                                  textScaler: TextScaler.linear(
                                    ui.textScaleFactor,
                                  ),
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontSize: 14,
                                        fontWeight: pageIndex == item.idx
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                        color: pageIndex == item.idx
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primary
                                            : Theme.of(
                                                context,
                                              ).colorScheme.primary.withOpacity(
                                                0.5,
                                              ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
