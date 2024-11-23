import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/home/home_screen.dart';
import 'package:mobile/profile/profile_screen.dart';
import 'package:mobile/search/search_screen.dart';
import 'package:mobile/widget/scaffold_with_navbar.dart';

// dart run build_runner build --delete-conflicting-outputs

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final searchNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'search');
final profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavbar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const HomeScreen(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: searchNavigatorKey,
          routes: [
            GoRoute(
              path: '/search',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const SearchScreen(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: profileNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const ProfileScreen(),
              ),
            )
          ],
        ),
      ],
    ),
  ],
);
