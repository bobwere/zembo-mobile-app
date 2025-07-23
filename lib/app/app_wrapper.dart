import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zembo_agent_app/app/app.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/application/battery_request/battery_request_cubit.dart';
import 'package:zembo_agent_app/application/connectivity/connectivity_cubit.dart';
import 'package:zembo_agent_app/application/notification/notification_cubit.dart';
import 'package:zembo_agent_app/application/shift/shift_cubit.dart';
import 'package:zembo_agent_app/injection.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthCubit>()..initialize()),
        BlocProvider(
          create: (context) => getIt<ConnectivityCubit>()..checkConnectivity(),
        ),
        BlocProvider(
          create: (context) => getIt<NotificationCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ShiftCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<BatteryRequestCubit>(),
        ),
      ],
      child: const App(),
    );
  }
}
