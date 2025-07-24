import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zembo_agent_app/application/auth/auth_cubit.dart';
import 'package:zembo_agent_app/presentation/pages/auth/login_page.dart';
import 'package:zembo_agent_app/presentation/pages/root/battery_requests/add_request_page.dart';
import 'package:zembo_agent_app/presentation/pages/root/battery_requests/request_delivery_page.dart';
import 'package:zembo_agent_app/presentation/pages/root/home/home_page.dart';
import 'package:zembo_agent_app/presentation/pages/root/home/notification_page.dart';
import 'package:zembo_agent_app/presentation/pages/root/profile/profile_page.dart';
import 'package:zembo_agent_app/presentation/pages/splash/splash_page.dart';
import 'package:zembo_agent_app/presentation/router/routes.dart';
import 'package:zembo_agent_app/presentation/widgets/scaffold_with_nested_nav.dart';
import 'package:zembo_agent_app/presentation/widgets/scaffold_with_nested_nav_rider.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _homeShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Home');

final _requestDeliveryShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'Request Delivery',
);

final _riderRequestDeliveryShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'Rider Request Delivery',
);

final _riderProfileShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'Rider Profile',
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

    final isLoggedIn = context.read<AuthCubit>().state.isAuthenticated ?? false;
    final goingToLoginPage = state.matchedLocation == loginPath;
    final goingToHomePage = state.matchedLocation == homePath;

    if (isLoggedIn && (goingToLoginPage || goingToHomePage)) {
      return homePath;
    }

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
          child: const SplashPage(),
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
          child: const LoginPage(),
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

    // Swapper Stateful nested navigation
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
                  child: const HomePage(),
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
                  name: notificationRoute,
                  path: notificationPath,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage<void>(
                      key: state.pageKey,
                      name: state.name,
                      child: const NotificationPage(),
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
                  child: const RequestDeliveryPage(),
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
                  name: addBatteryRequestRoute,
                  path: addBatteryRequestPath,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage<void>(
                      key: state.pageKey,
                      name: state.name,
                      child: const AddBatteryRequestPage(),
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
                  child: const ProfilePage(),
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

    //Rider Stateful nested navigation
    //
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return ScaffoldWithNestedNavigationRider(
          navigationShell: navigationShell,
        );
      },
      branches: [
        // first branch
        StatefulShellBranch(
          navigatorKey: _riderRequestDeliveryShellNavigatorKey,
          initialLocation: riderRequestDeliveryPath,
          routes: [
            GoRoute(
              name: riderRequestDeliveryRoute,
              path: riderRequestDeliveryPath,
              pageBuilder: (context, state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  name: state.name,
                  child: const RequestDeliveryPage(),
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
                  name: riderNotificationRoute,
                  path: riderNotificationPath,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage<void>(
                      key: state.pageKey,
                      name: state.name,
                      child: const NotificationPage(),
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

        // second branch
        StatefulShellBranch(
          navigatorKey: _riderProfileShellNavigatorKey,
          initialLocation: riderProfilePath,
          routes: [
            GoRoute(
              name: riderProfileRoute,
              path: riderProfilePath,
              pageBuilder: (context, state) {
                return CustomTransitionPage<void>(
                  key: state.pageKey,
                  name: state.name,
                  child: const ProfilePage(),
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
