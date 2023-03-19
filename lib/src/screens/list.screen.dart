import 'package:flutter/material.dart';
import 'package:vifacilita/data/route.data.dart';
import 'package:vifacilita/localization/app_localizations.dart';
import 'package:vifacilita/src/components/list_tile_button.dart';

class ListScreen extends StatelessWidget {
  final Routes routeName;

  const ListScreen({
    super.key,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    final routeItem = routeData[routeName.path];
    AppLocalizations localizations = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(localizations.t(routeItem!.title!)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext constext, int index) {
                  return const ListTileButton();
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.app_registration_outlined),
                  label: Text(localizations.t(routeItem.button!)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
