import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zembo_agent_app/presentation/router/routes.dart';
import 'package:zembo_agent_app/presentation/widgets/scaffold_with_nested_nav.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _homeShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _requestDeliveryShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'Request Delivery',
);
final _profileShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'Profile',
);

GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: initialPath,
  navigatorKey: _rootNavigatorKey,
  observers: [],
  redirect: (BuildContext context, GoRouterState state) async {
    if (state.matchedLocation == initialPath) {
      return null;
    }

    // final isLoggedIn =
    //     false; // context.read<AuthCubit>().state.isAuthenticated ?? false;
    // final goingToLoginPage = state.matchedLocation == loginPath;
    // final goingToDashBoardPage = state.matchedLocation == homePath;

    // if (isLoggedIn && (goingToLoginPage || goingToDashBoardPage)) {
    //   // final userID = context.read<AuthCubit>().state.user?.id ?? '';
    //   // if (context.read<TableCubit>().state.marketTables!.isEmpty) {
    //   //   unawaited(context.read<TableCubit>().fetchMarketTables(userID));
    //   //   unawaited(context.read<NotificationCubit>().getAllNotifications());
    //   // }

    //   // final state = context.read<AuthCubit>().state;

    //   return homePath;
    // }

    // no need to redirect at all
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      name: initialRoute,
      path: initialPath,
      pageBuilder: (context, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          name: state.name,
          child: const Scaffold(),
          transitionsBuilder:
              (
                context,
                animation,
                secondaryAnimation,
                child,
              ) => FadeTransition(opacity: animation, child: child),
        );
      },
    ),
    GoRoute(
      name: loginRoute,
      path: loginPath,
      pageBuilder: (context, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          name: state.name,
          child: const Scaffold(),
          transitionsBuilder:
              (
                context,
                animation,
                secondaryAnimation,
                child,
              ) => FadeTransition(opacity: animation, child: child),
        );
      },
      routes: [
        GoRoute(
          name: requestNewPasswordRoute,
          path: requestNewPasswordPath,
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              name: state.name,
              child: const Scaffold(),
              transitionsBuilder:
                  (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) => FadeTransition(opacity: animation, child: child),
            );
          },
          routes: [
            GoRoute(
              name: changePasswordRoute,
              path: changePasswordPath,
              pageBuilder: (context, state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  name: state.name,
                  child: const Scaffold(),
                  transitionsBuilder:
                      (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) => FadeTransition(opacity: animation, child: child),
                );
              },
            ),
          ],
        ),
      ],
    ),

    // Stateful nested navigation
    //
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return ScaffoldWithNestedNavigation(
          navigationShell: navigationShell,
        );
      },
      branches: [
        // first branch
        StatefulShellBranch(
          navigatorKey: _homeShellNavigatorKey,
          initialLocation: homePath,
          routes: [
            GoRoute(
              name: homeRoute,
              path: homePath,
              pageBuilder: (context, state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  name: state.name,
                  child: const Scaffold(),
                  transitionsBuilder:
                      (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) => FadeTransition(opacity: animation, child: child),
                );
              },
            ),
          ],
        ),

        // second branch
        StatefulShellBranch(
          navigatorKey: _requestDeliveryShellNavigatorKey,
          initialLocation: requestDeliveryPath,
          routes: [
            GoRoute(
              name: requestDeliveryRoute,
              path: requestDeliveryPath,
              pageBuilder: (context, state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  name: state.name,
                  child: const Scaffold(),
                  transitionsBuilder:
                      (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) => FadeTransition(opacity: animation, child: child),
                );
              },
            ),
          ],
        ),

        // third branch
        StatefulShellBranch(
          navigatorKey: _profileShellNavigatorKey,
          initialLocation: profilePath,
          routes: [
            GoRoute(
              name: profileRoute,
              path: profilePath,
              pageBuilder: (context, state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  name: state.name,
                  child: const Scaffold(),
                  transitionsBuilder:
                      (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) => FadeTransition(opacity: animation, child: child),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (BuildContext context, GoRouterState state) => const Scaffold(),
);
