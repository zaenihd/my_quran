// router/route_names.dart
class RouteName {
  static const welcome = 'welcome';
  static const home = 'home';
  static const detail = 'detail';
  static const doa = 'doa';
  static const search = 'search';
  static const jadwalSolat = 'jadwalSolat';
}

// router/route_paths.dart
class RoutePath {
  static const welcome = '/';
  static const home = '/home';
  static const jadwalSolat = '/jadwalSolat';
  static const doa = '/doa';
  static const search = '/search';
  static const detail = '/detail'; // gunakan /detail/:id di GoRoute
}
