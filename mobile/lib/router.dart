import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/home/home_screen.dart';
import 'package:mobile/profile/profile_screen.dart';
import 'package:mobile/search/search_screen.dart';
import 'package:mobile/widget/scaffold_with_navbar.dart';

// dart run build_runner build --delete-conflicting-outputs

part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final searchNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'search');
final profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  routes: $appRoutes,
);

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranch>(
      routes: [
        TypedGoRoute<HomeRouteData>(
          path: '/home',
        ),
      ],
    ),
    TypedStatefulShellBranch<SearchBranch>(
      routes: [
        TypedGoRoute<SearchRouteData>(
          path: '/search',
        ),
      ],
    ),
    TypedStatefulShellBranch<ProfileBranch>(
      routes: [
        TypedGoRoute<ProfileRouteData>(
          path: '/profile',
        ),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ScaffoldWithNavbar(
      navigationShell: navigationShell,
    );
  }
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = homeNavigatorKey;
}

class SearchBranch extends StatefulShellBranchData {
  const SearchBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = searchNavigatorKey;
}

class ProfileBranch extends StatefulShellBranchData {
  const ProfileBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = profileNavigatorKey;
}

class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class SearchRouteData extends GoRouteData {
  const SearchRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchScreen();
  }
}

class ProfileRouteData extends GoRouteData {
  const ProfileRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileScreen();
  }
}
