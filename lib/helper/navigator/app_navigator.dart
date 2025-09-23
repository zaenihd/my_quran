import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/data/model/doa_model.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/helper/navigator/route_name.dart';
import 'package:my_quran/pages/detail/view/detail_page.dart';
import 'package:my_quran/pages/doa/doa_page.dart';
import 'package:my_quran/pages/home/view/home_page.dart';
import 'package:my_quran/pages/search/view/search_page.dart';

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

              return DetailPage(id: id, idInt: extra);
            },
          ),
          GoRoute(
            path: RoutePath.doa,
            name: RouteName.doa,
            builder: (BuildContext context, GoRouterState state) {
              final extra = state.extra as Doa;
              // final idInt = extra['surat'] as Surat;
              return DoaPage(doa: extra);
            },
          ),
          GoRoute(
            path: RoutePath.home,
            name: RouteName.home,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: RoutePath.search,
            name: RouteName.search,
            builder: (BuildContext context, GoRouterState state) {
              final extra = state.extra as List<Surat>;
              return SearchPage(surat: extra);
            },
          ),
        ],
      ),
    ],
  );
}
