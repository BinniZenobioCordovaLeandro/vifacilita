import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vifacilita/data/route.data.dart';
import 'package:vifacilita/localization/app_localizations.dart';
import 'package:vifacilita/models/app_route_model.dart';
import 'package:vifacilita/redux/app_state.dart';
import 'package:vifacilita/redux/records/records.action.dart';
import 'package:vifacilita/src/helper/modal_bottom_sheet.helper.dart';
import 'package:vifacilita/src/screens/components/list_records.dart';
import 'package:vifacilita/src/screens/components/save_record_form.dart';

class ListScreen extends StatefulWidget {
  final Routes routeName;

  const ListScreen({
    super.key,
    required this.routeName,
  });

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late AppRouteModel routeItem;
  late CollectionReference collection;

  bool? userIsSigned = true;

  @override
  void initState() {
    super.initState();
    routeItem = routeData[widget.routeName.path]!;
    collection = FirebaseFirestore.instance.collection(routeItem.collection!);
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
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(getRecords(routeItem.collection!));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(localizations.t(routeItem.title!)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: ListRecords(),
            ),
            if (userIsSigned == true)
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        ModalBottomSheetHelper(
                          context: context,
                          title: localizations.t(routeItem.button!),
                          child: SingleChildScrollView(
                            child: SaveRecordForm(
                              routeName: widget.routeName,
                              collection: routeItem.collection!,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_box),
                      label: Text(
                        localizations.t(routeItem.button!),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
