import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/application/notification/notification_cubit.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/presentation/widgets/bar.dart';
import 'package:zembo_agent_app/presentation/widgets/empty_state_card.dart';
import 'package:zembo_agent_app/presentation/widgets/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Bar(
                  title: 'Notifications',
                  backButtonEnabled: true,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      unawaited(
                        context.read<NotificationCubit>().getAllNotifications(
                          context.read<AuthCubit>().state.user!.id!,
                        ),
                      );
                    },
                    child: ListView(
                      children: [
                        if (state.notifications?.isEmpty ?? true)
                          const Padding(
                            padding: EdgeInsets.only(top: 80),
                            child: EmptyStateCard(
                              title: 'No notifications Yet!',
                              description:
                                  'Any new notifications you may have will show up here!',
                            ),
                          )
                        else
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.notifications?.length ?? 0,
                              separatorBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ui.scaleWidthFactor(12),
                                  vertical: ui.scaleHeightFactor(8),
                                ),
                                child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              itemBuilder: (context, index) {
                                final notification =
                                    state.notifications![index];
                                return NotificationCard(
                                  notifiction: notification,
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
