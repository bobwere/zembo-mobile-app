import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/widgets/app_button.dart';
import 'package:zembo_agent_app/presentation/widgets/digital_clock_widget.dart';
import 'package:zembo_agent_app/presentation/widgets/shift_history_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                height: ui.scaleHeightFactor(350),
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
                        onPressed: () {},
                        icon: const Icon(
                          LineAwesomeIcons.bell,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ui.scaleWidthFactor(16),
                        ),
                        child: Text(
                          'Hi ${authState.user?.username ?? ''}!',
                          textScaler: TextScaler.linear(ui.textScaleFactor),
                          style: Theme.of(context).textTheme.headlineMedium
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: ui.scaleHeightFactor(16)),
                            Text(
                              'There is no shifts for you today',
                              textScaler: TextScaler.linear(ui.textScaleFactor),
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    height: 1,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                            ),
                            SizedBox(height: ui.scaleHeightFactor(20)),
                            Builder(
                              builder: (context) {
                                final isLoading = context
                                    .select<AuthCubit, bool>(
                                      (b) =>
                                          b.state.signInFormStatus ==
                                          AppStatus.submitting,
                                    );

                                return AppButton(
                                  width: ui.scaleWidthFactor(160),
                                  isFullWidth: false,
                                  isLoading: isLoading,
                                  onPressed: () {},
                                  text: 'Start Shift',
                                );
                              },
                            ),
                            SizedBox(height: ui.scaleHeightFactor(16)),
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
                                color: const Color.fromARGB(255, 250, 206, 175),
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
                                    SizedBox(width: ui.scaleWidthFactor(10)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Shift History',
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
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'View All',
                                style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }
}
