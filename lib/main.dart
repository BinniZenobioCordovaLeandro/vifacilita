import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vifacilita/data/route.data.dart';
import 'package:vifacilita/firebase_options.dart';
import 'package:vifacilita/localization/app_localizations.dart';
import 'package:vifacilita/redux/app_state.dart';
import 'package:vifacilita/redux/app_store.dart';
import 'package:vifacilita/src/screens/home.screen.dart';
import 'package:vifacilita/src/screens/list.screen.dart';
import 'package:vifacilita/src/screens/login.screen.dart';
import 'package:vifacilita/src/themes/app.theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme().get(),
        home: const HomeScreen(),
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == Routes.login.path) {
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return const LoginScreen();
              },
            );
          }
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
      ),
    );
  }
}
