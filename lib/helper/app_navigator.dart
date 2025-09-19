import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/helper/route_name.dart';
import 'package:my_quran/pages/detail/view/detail_page.dart';
import 'package:my_quran/pages/home/view/home_page.dart';
import 'package:my_quran/pages/welcome_page/view/welcome_page.dart';

class AppNavigator {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutePath.welcome,
        name: RouteName.welcome,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: "${RoutePath.detail}/:idSurat",
            name: RouteName.detail,
            builder: (BuildContext context, GoRouterState state) {
              final id = state.pathParameters['idSurat']!;
              final extra = state.extra as Surat;
              // final idInt = extra['surat'] as Surat;

              return DetailPage(id: id, idInt: extra,);
            },
          ),
          GoRoute(
            path: RoutePath.home,
            name: RouteName.home,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
        ],
      ),
    ],
  );
}
