import 'package:flutter/material.dart';
import 'package:vifacilita/data/route.data.dart';
import 'package:vifacilita/localization/app_localizations.dart';
import 'package:vifacilita/src/components/list_tile_button.dart';
import 'package:vifacilita/src/components/text_form_field.component.dart';
import 'package:vifacilita/src/helper/modal_bottom_sheet.helper.dart';

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
                  onPressed: () {
                    ModalBottomSheetHelper(
                      context: context,
                      title: localizations.t(routeItem.button!),
                      child: Form(
                        child: FractionallySizedBox(
                          widthFactor: 0.9,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormFieldComponent(
                                    labelText: localizations
                                        .t('${routeItem.path}.title.label'),
                                    helperText: localizations
                                        .t('${routeItem.path}.title.helper'),
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (!(value != null)) {
                                        return localizations.t(
                                            '${routeItem.path}.title.validator');
                                      }
                                      return '';
                                    },
                                  ),
                                  const Divider(),
                                  TextFormFieldComponent(
                                    labelText: localizations
                                        .t('${routeItem.path}.subtitle.label'),
                                    helperText: localizations
                                        .t('${routeItem.path}.subtitle.helper'),
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (!(value != null)) {
                                        return localizations.t(
                                            '${routeItem.path}.subtitle.validator');
                                      }
                                      return '';
                                    },
                                  ),
                                  const Divider(),
                                  TextFormFieldComponent(
                                    labelText: localizations
                                        .t('${routeItem.path}.category.label'),
                                    helperText: localizations
                                        .t('${routeItem.path}.category.helper'),
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (!(value != null)) {
                                        return localizations.t(
                                            '${routeItem.path}.category.validator');
                                      }
                                      return '';
                                    },
                                  ),
                                  const Divider(),
                                  TextFormFieldComponent(
                                    labelText: localizations
                                        .t('${routeItem.path}.phone.label'),
                                    helperText: localizations
                                        .t('${routeItem.path}.phone.helper'),
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (!(value != null)) {
                                        return localizations.t(
                                            '${routeItem.path}.phone.validator');
                                      }
                                      return '';
                                    },
                                  ),
                                  const Divider(),
                                  TextFormFieldComponent(
                                    labelText: localizations
                                        .t('${routeItem.path}.email.label'),
                                    helperText: localizations
                                        .t('${routeItem.path}.email.helper'),
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (!(value != null)) {
                                        return localizations.t(
                                            '${routeItem.path}.email.validator');
                                      }
                                      return '';
                                    },
                                  ),
                                  const Divider(),
                                  OutlinedButton.icon(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                        Icons.app_registration_outlined),
                                    label: Text(
                                      localizations
                                          .t('${routeItem.path}.button'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
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
            )
          ],
        ),
      ),
    );
  }
}
