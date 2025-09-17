import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/helper/route_name.dart';
import 'package:my_quran/pages/detail/view/detail_page.dart';
import 'package:my_quran/pages/home/view/home_page.dart';
import 'package:my_quran/pages/welcome_page/view/welcome_page.dart';

class AppNavigator {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RouteName.welcomePage,
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouteName.detail,
            builder: (BuildContext context, GoRouterState state) {
              return const DetailPage();
            },
          ),
          GoRoute(
            path: RouteName.home,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
        ],
      ),
    ],
  );
}
