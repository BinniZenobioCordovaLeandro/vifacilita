import 'package:flutter/material.dart';
import 'package:vifacilita/data/route.data.dart';
import 'package:vifacilita/src/screens/home.screen.dart';
import 'package:vifacilita/src/screens/list.screen.dart';
import 'package:vifacilita/src/themes/app.theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().get(),
      home: const HomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == Routes.medico.path) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const ListScreen(
                routeName: Routes.medico,
              );
            },
          );
        }
        if (settings.name == Routes.farmacia.path) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const ListScreen(
                routeName: Routes.farmacia,
              );
            },
          );
        }
        if (settings.name == Routes.accompagnatore.path) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const ListScreen(
                routeName: Routes.accompagnatore,
              );
            },
          );
        }
        if (settings.name == Routes.necessita.path) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const ListScreen(
                routeName: Routes.necessita,
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
