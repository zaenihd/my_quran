import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/helper/route_name.dart';
import 'package:my_quran/pages/detail/view/detail_page.dart';
import 'package:my_quran/pages/home/view/home_page.dart';

class AppNavigator {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RouteName.homePage,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouteName.detail,
            builder: (BuildContext context, GoRouterState state) {
              return const DetailPage();
            },
          ),
        ],
      ),
    ],
  );
}
