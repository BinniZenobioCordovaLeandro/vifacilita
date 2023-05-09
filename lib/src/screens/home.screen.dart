import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vifacilita/data/home.data.dart';
import 'package:vifacilita/data/route.data.dart';
import 'package:vifacilita/localization/app_localizations.dart';
import 'package:vifacilita/src/components/image_button.dart';
import 'package:vifacilita/src/helper/launcher_link.helper.dart';
import 'package:vifacilita/src/themes/app.theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? userIsSigned = true;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          userIsSigned = false;
        });
      } else {
        setState(() {
          userIsSigned = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localizations.t('app_name'),
        ),
        actions: [
          if (userIsSigned == false)
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.login.path!),
              icon: const Icon(Icons.login_outlined),
            ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              children: [
                const Divider(),
                Expanded(
                  flex: 1,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1,
                    ),
                    itemCount: homeData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final cardItem = homeData[index];
                      return ButtonImage(
                        image: cardItem.icon!,
                        title: localizations.t(cardItem.title!),
                        onTap: () {
                          Navigator.of(context).pushNamed(cardItem.link!);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(AppTheme.borderRadius),
                    child: Image.asset(
                      'assets/images/comuna.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          LauncherLinkHelper(url: '112', isPhone: true)
                              .makePhoneCall(),
                      icon: const Icon(Icons.call, color: Colors.white),
                      label: Text(
                        localizations.t('emergency_button'),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
