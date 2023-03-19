import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vifacilita/data/route.data.dart';
import 'package:vifacilita/localization/app_localizations.dart';
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
        if (settings.name == Routes.doctor.path) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const ListScreen(
                routeName: Routes.doctor,
              );
            },
          );
        }
        if (settings.name == Routes.pharmacy.path) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const ListScreen(
                routeName: Routes.pharmacy,
              );
            },
          );
        }
        if (settings.name == Routes.accompanist.path) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const ListScreen(
                routeName: Routes.accompanist,
              );
            },
          );
        }
        if (settings.name == Routes.market.path) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const ListScreen(
                routeName: Routes.market,
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('it'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
