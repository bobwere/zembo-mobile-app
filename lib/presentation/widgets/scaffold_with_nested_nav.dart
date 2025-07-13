// ignore_for_file: avoid_catches_without_on_clauses, deprecated_member_use, document_ignores, lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';

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
      // await NotificationService.instance.initialize(context);
      // await NotificationService.instance.deleteToken();

      // final token = await NotificationService.instance.getDeviceToken();
      // await context.read<NotificationCubit>().registerDeviceToken(token ?? '');
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.navigationShell,
      bottomNavigationBar: SafeArea(
        child: Container(
          height: Platform.isIOS ? 90 : 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.09),
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

                      // final userId =
                      //     context.read<AuthCubit>().state.user?.id ?? '';

                      // switch (item.idx) {
                      //   case 0:
                      //     context.read<TableCubit>().fetchMarketTables(
                      //       userId,
                      //       onBackGround: true,
                      //     );
                      //   case 1:
                      //     context.read<TableCubit>().fetchMarketTables(
                      //       userId,
                      //       onBackGround: true,
                      //     );
                      //   case 2:
                      //     context.read<PaymentCubit>().fetchWallet(
                      //       onBackGround: true,
                      //     );
                      //     context.read<PaymentCubit>().fetchWalletTransactions(
                      //       onBackGround: true,
                      //     );
                      //   case 3:
                      //     context.read<AuthCubit>().getUserProfile();
                      //   default:
                      // }
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
                              color: Theme.of(context).colorScheme.primary,
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
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: pageIndex == item.idx
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(
                                          context,
                                        ).colorScheme.primary.withOpacity(0.3),
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
    );
  }
}
