import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/router/routes.dart';
import 'package:zembo_agent_app/presentation/widgets/action_tile.dart';
import 'package:zembo_agent_app/presentation/widgets/app_button.dart';
import 'package:zembo_agent_app/presentation/widgets/bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isAuthenticated == false) {
          context.goNamed(loginRoute);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const Bar(title: 'Profile'),
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          SizedBox(height: ui.scaleHeightFactor(20)),

                          CircleAvatar(
                            radius: ui.scaleHeightFactor(50),
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage: const AssetImage(
                              'assets/images/png/avatar.jpg',
                            ),
                          ),
                          SizedBox(height: ui.scaleHeightFactor(20)),
                          Text(
                            state.user?.username ?? '',
                            textScaler: TextScaler.linear(ui.textScaleFactor),
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                          ),
                          Text(
                            state.user?.role ?? '',
                            textScaler: TextScaler.linear(ui.textScaleFactor),
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  height: 1,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade400,
                                ),
                          ),
                          SizedBox(height: ui.scaleHeightFactor(10)),
                          AppButton(
                            onPressed: () {},
                            text: 'Edit Profile',
                            isFullWidth: false,
                          ),
                          SizedBox(height: ui.scaleHeightFactor(40)),
                          Container(
                            height: ui.scaleHeightFactor(170),
                            width: ui.width,
                            margin: EdgeInsets.all(ui.scaleHeightFactor(16)),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(ui.scaleHeightFactor(16)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Invite Friends',
                                          textScaler: TextScaler.linear(
                                            ui.textScaleFactor,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                color: Colors.white,
                                              ),
                                        ),
                                        SizedBox(
                                          height: ui.scaleHeightFactor(20),
                                        ),
                                        Text(
                                          'Invite your friends to the platform and earn KES 50 each.',
                                          textScaler: TextScaler.linear(
                                            ui.textScaleFactor,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/png/piggy.png',
                                    height: ui.scaleHeightFactor(80),
                                    width: ui.scaleWidthFactor(80),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: ui.scaleWidthFactor(16),
                              ),
                              child: Text(
                                'Actions',
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
                          ActionTile(
                            icon: LineAwesomeIcons.bell_solid,
                            onPressed: () {},
                            substitle: 'Access your notifications.',
                            title: 'Notifications',
                          ),
                          ActionTile(
                            icon: LineAwesomeIcons.hammer_solid,
                            onPressed: () async {},
                            substitle:
                                'Change your PIN regularly to secure your account',
                            title: 'Change PIN',
                          ),
                          ActionTile(
                            icon: LineAwesomeIcons.hammer_solid,
                            onPressed: () async {},
                            substitle: 'Commission Rules',
                            title: 'Commission Rules',
                          ),
                          ActionTile(
                            icon: LineAwesomeIcons.discourse,
                            onPressed: () async {},
                            substitle: 'FAQS',
                            title: 'Read FAQS',
                          ),
                          ActionTile(
                            icon: LineAwesomeIcons.paperclip_solid,
                            onPressed: () async {},
                            substitle: 'Read privacy policy',
                            title: 'Privacy Policy',
                          ),
                          ActionTile(
                            icon: LineAwesomeIcons.share_alt_solid,
                            onPressed: () async {},
                            substitle: 'Share app with family and friends',
                            title: 'Share the app',
                          ),
                          ActionTile(
                            icon: LineAwesomeIcons.comment,
                            onPressed: () {},
                            substitle: 'Chat with us',
                            title: 'Chat with us',
                          ),
                          ActionTile(
                            icon: LineAwesomeIcons.sign_out_alt_solid,
                            onPressed: () {
                              context.read<AuthCubit>().signOut();
                            },
                            substitle: 'Log out',
                            title: 'Terminate your session',
                          ),
                          SizedBox(height: ui.scaleHeightFactor(30)),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
