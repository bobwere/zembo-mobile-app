import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/application/battery_request/battery_request_cubit.dart';
import 'package:zembo_agent_app/application/notification/notification_cubit.dart';
import 'package:zembo_agent_app/application/shift/shift_cubit.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/router/routes.dart';
import 'package:zembo_agent_app/presentation/widgets/app_button.dart';
import 'package:zembo_agent_app/presentation/widgets/app_input.dart';
import 'package:zembo_agent_app/presentation/widgets/input_label.dart';
import 'package:zembo_agent_app/presentation/widgets/snackbar_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisibility = true;
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (p, c) => p.signInFormStatus != c.signInFormStatus,
      listener: (context, state) {
        if (state.signInFormStatus == AppStatus.success) {
          final user = state.user;
          context.read<ShiftCubit>().updateShiftAndStation(
            user?.shift,
            user?.station,
          );

          if (user != null) {
            context.read<ShiftCubit>().fetchActiveShift(user.id!);
            context.read<ShiftCubit>().fetchCurrentDaysShiftHistory();
            context.read<ShiftCubit>().fetchAllShiftHistory(user.id!);
            context.read<BatteryRequestCubit>().getBatteryRequests(user.id!);
            context.read<NotificationCubit>().getAllNotifications(user.id!);
          }

          context.goNamed(homeRoute);
        }

        if (state.signInFormStatus == AppStatus.failure) {
          showSnackBar(
            context,
            title: 'An Error Occurred',
            message: state.signInError ?? 'An error occurred',
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    SizedBox(height: ui.scaleWidthFactor(60)),
                    Align(
                      child: Image.asset(
                        scale: ui.scale,
                        width: ui.scaleWidthFactor(180),
                        'assets/images/png/logo.png',
                      ),
                    ),
                    SizedBox(height: ui.scaleWidthFactor(40)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ui.scaleWidthFactor(16),
                        ),
                        child: Text(
                          'Log In',
                          textScaler: TextScaler.linear(ui.textScaleFactor),
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                height: 1,
                                fontSize: 18,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: ui.scaleWidthFactor(10)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ui.scaleWidthFactor(16),
                        ),
                        child: Text(
                          "Let's get to work",
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
                    SizedBox(height: ui.scaleHeightFactor(40)),
                    const InputLabel(label: 'Username'),
                    Builder(
                      builder: (context) {
                        final error = context.select<AuthCubit, String?>(
                          (b) => b.state.signInEmailErrors?.join('\n'),
                        );

                        return AppInput(
                          error: error,
                          onChange: (value) {
                            setState(() {
                              username = value;
                            });
                          },
                          hintText: 'Enter your username',
                          prefixIcon: LineAwesomeIcons.user_solid,
                        );
                      },
                    ),
                    const InputLabel(label: 'Password'),
                    Builder(
                      builder: (context) {
                        final error = context.select<AuthCubit, String?>(
                          (b) => b.state.signInEmailErrors?.join('\n'),
                        );

                        return AppInput(
                          error: error,
                          obscureText: passwordVisibility,
                          onChange: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          hintText: 'Enter your password',
                          prefixIcon: LineAwesomeIcons.lock_solid,
                          suffixWidget: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                            icon: Icon(
                              passwordVisibility
                                  ? LineAwesomeIcons.eye_slash
                                  : LineAwesomeIcons.eye,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: ui.scaleHeightFactor(40)),
                    Builder(
                      builder: (context) {
                        final isLoading = context.select<AuthCubit, bool>(
                          (b) =>
                              b.state.signInFormStatus == AppStatus.submitting,
                        );

                        return AppButton(
                          isLoading: isLoading,
                          onPressed: () {
                            if (username.isEmpty) {
                              showSnackBar(
                                context,
                                message: 'Please enter a username to proceed',
                              );

                              return;
                            }

                            if (password.isEmpty) {
                              showSnackBar(
                                context,
                                message: 'Please enter a password to proceed',
                              );

                              return;
                            }

                            context
                                .read<AuthCubit>()
                                .signInWithUsernameAndPassword(
                                  username: username,
                                  password: password,
                                );
                          },
                          text: 'Login',
                        );
                      },
                    ),
                    const Spacer(),
                    Align(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {},
                        child: RichText(
                          textAlign: TextAlign.center,
                          textScaler: TextScaler.linear(ui.textScaleFactor),
                          text: TextSpan(
                            text: "Don't have an account?\n",
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey.shade600,
                              height: 1.3,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ui.scaleHeightFactor(20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
