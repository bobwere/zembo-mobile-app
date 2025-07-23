// ignore_for_file: unawaited_futures, use_build_context_synchronously, document_ignores

// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/application/notification/notification_cubit.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/domain/notification/app_notification.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.notifiction,
    super.key,
  });

  final AppNotification notifiction;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return GestureDetector(
      onTap: () {
        context.read<NotificationCubit>().markNotificationAsRead(
          notifiction.id!,
          context.read<AuthCubit>().state.user!.id!,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: notifiction.isRead!
              ? Colors.white
              : ui.theme.colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: ui.scaleWidthFactor(16)),
        padding: EdgeInsets.symmetric(
          horizontal: ui.scaleWidthFactor(16),
          vertical: ui.scaleWidthFactor(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Image.asset(
              'assets/images/png/bell.png',
              scale: ui.scale,
              height: ui.scaleWidthFactor(40),
              width: ui.scaleWidthFactor(40),
            ),
            SizedBox(width: ui.scaleWidthFactor(16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          notifiction.title ?? '',
                          textScaler: TextScaler.linear(ui.textScaleFactor),
                          style: ui.theme.textTheme.headlineMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: ui.scaleWidthFactor(13)),
                        child: Text(
                          Jiffy.parse(
                            notifiction.createdAt ?? DateTime.now().toString(),
                          ).format(pattern: 'dd MMM yyyy'),
                          textScaler: TextScaler.linear(ui.textScaleFactor),
                          style: ui.theme.textTheme.headlineMedium?.copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: ui.scaleWidthFactor(5)),

                  Text(
                    notifiction.message ?? '',
                    textScaler: TextScaler.linear(ui.textScaleFactor),
                    style: ui.theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: ui.scaleWidthFactor(16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
