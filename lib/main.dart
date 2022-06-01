import 'package:flutter/material.dart';
import 'Pages/choose_location.dart';
import 'Pages/home.dart';
import 'Pages/loading.dart';

void main() => runApp(const MaterialApp(
      initialRoute: '/location',
      onGenerateRoute: Routes.generateRoutes,
    ));

class Routes {
  static Route<dynamic>? generateRoutes(RouteSettings routeSettings) {
    final argumento = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        if (argumento is Map<String, dynamic>) {
          return MaterialPageRoute(
              builder: (_) => Loading(
                    location: argumento['location'],
                    flag: argumento['flag'],
                    url: argumento['url'],
                  ),
              settings: routeSettings);
        }
        return _errorRoute();
      case '/home':
        if (argumento is Map<String, dynamic>) {
          return MaterialPageRoute(
              builder: (_) => Home(
                  location: argumento['location'],
                  time: argumento['time'],
                  flag: argumento['flag'],
                  isDayTime: argumento['isDayTime']),
              settings: routeSettings);
        }

        return _errorRoute();
      case '/location':
        return MaterialPageRoute(
            builder: (_) => const ChooseLocation(), settings: routeSettings);

      default:
        _errorRoute();
    }
    return null;
  }

  /// Route for erroneous navigation
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
