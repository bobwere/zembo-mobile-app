import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/application/battery_request/battery_request_cubit.dart';
import 'package:zembo_agent_app/application/shift/shift_cubit.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/widgets/app_button.dart';
import 'package:zembo_agent_app/presentation/widgets/app_input.dart';
import 'package:zembo_agent_app/presentation/widgets/bar.dart';
import 'package:zembo_agent_app/presentation/widgets/input_label.dart';
import 'package:zembo_agent_app/presentation/widgets/snackbar_widget.dart';

class AddBatteryRequestPage extends StatefulWidget {
  const AddBatteryRequestPage({super.key});

  @override
  State<AddBatteryRequestPage> createState() => _AddBatteryRequestPageState();
}

class _AddBatteryRequestPageState extends State<AddBatteryRequestPage> {
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
              message: 'Battery request submitted successfully',
            );
            context.pop();
          }

          if (state.batteryRequestStatus == AppStatus.failure) {
            showSnackBar(
              context,
              title: 'An Error Occurred',
              message: state.batteryRequestError ?? 'An error occurred',
            );
          }
        },
        child: BlocBuilder<BatteryRequestCubit, BatteryRequestState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  const Bar(
                    title: 'Add Battery Request',
                    backButtonEnabled: true,
                  ),
                  SizedBox(height: ui.scaleHeightFactor(14)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ui.scaleWidthFactor(16),
                      ),
                      child: Text(
                        'Submit a battery request directly from the app. Track the request status and sync automatically when back online.',
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
                  const InputLabel(label: 'Number of Batteries'),
                  Builder(
                    builder: (context) {
                      final error = context.select<AuthCubit, String?>(
                        (b) => b.state.signInEmailErrors?.join('\n'),
                      );

                      return AppInput(
                        error: error,
                        textInputType: TextInputType.number,
                        inputFilters: [FilteringTextInputFormatter.digitsOnly],
                        onChange: (value) {
                          setState(() {
                            numberOfbatteries = value;
                          });
                        },
                        hintText: 'Enter number of batteries',
                        prefixIcon: LineAwesomeIcons.battery_empty_solid,
                      );
                    },
                  ),
                  SizedBox(height: ui.scaleHeightFactor(40)),
                  Builder(
                    builder: (context) {
                      final isLoading = context
                          .select<BatteryRequestCubit, bool>(
                            (b) =>
                                b.state.batteryRequestStatus ==
                                AppStatus.submitting,
                          );

                      return AppButton(
                        isLoading: isLoading,
                        onPressed: () {
                          if (numberOfbatteries.isEmpty) {
                            showSnackBar(
                              context,
                              message:
                                  'Please enter a number of batteries to proceed',
                            );

                            return;
                          }

                          if (int.parse(numberOfbatteries) == 0) {
                            showSnackBar(
                              context,
                              message:
                                  'Please enter a number of batteries greater than 0 to proceed',
                            );

                            return;
                          }

                          final shiftState = context.read<ShiftCubit>().state;
                          final authState = context.read<AuthCubit>().state;
                          context
                              .read<BatteryRequestCubit>()
                              .createBatteryRequest(
                                numberOfBatteries: int.parse(numberOfbatteries),
                                destination:
                                    shiftState.currentStation!.location!,
                                swapper: authState.user!,
                              );
                        },
                        text: 'Request Battery',
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
