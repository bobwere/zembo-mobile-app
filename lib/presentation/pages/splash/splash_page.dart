import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/application/battery_request/battery_request_cubit.dart';
import 'package:zembo_agent_app/application/notification/notification_cubit.dart';
import 'package:zembo_agent_app/application/shift/shift_cubit.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/router/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.isAuthenticated != current.isAuthenticated,
      listener: (context, state) async {
        if (state.isAuthenticated != null && state.isAuthenticated!) {
          final user = state.user;
          context.read<ShiftCubit>().updateShiftAndStation(
            user?.shift,
            user?.station,
          );

          if (user != null) {
            unawaited(
              context.read<NotificationCubit>().getAllNotifications(user.id!),
            );

            if (user.role == 'rider') {
              unawaited(
                context
                    .read<BatteryRequestCubit>()
                    .getRiderBatteryDeliveryRequests(user.id!),
              );
              context.goNamed(riderRequestDeliveryRoute);
            }

            if (user.role == 'swapper') {
              unawaited(
                context.read<ShiftCubit>().fetchAllShiftHistory(user.id!),
              );
              unawaited(
                context.read<BatteryRequestCubit>().getBatteryRequests(
                  user.id!,
                ),
              );
              context.goNamed(homeRoute);
            }
          }
        } else {
          context.goNamed(loginRoute);
        }
        return;
      },
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Image.asset(
              scale: ui.scale,
              width: ui.scaleWidthFactor(180),
              'assets/images/png/logo.png',
            ),
          ),
        ),
      ),
    );
  }
}
