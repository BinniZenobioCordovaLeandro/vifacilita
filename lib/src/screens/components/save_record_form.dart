import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vifacilita/data/route.data.dart';
import 'package:vifacilita/localization/app_localizations.dart';
import 'package:vifacilita/models/app_route_model.dart';
import 'package:vifacilita/models/record_collection.model.dart';
import 'package:vifacilita/redux/app_state.dart';
import 'package:vifacilita/redux/record/record.action.dart';
import 'package:vifacilita/src/components/text_form_field.component.dart';

class SaveRecordForm extends StatefulWidget {
  final Routes routeName;
  final String collection;

  const SaveRecordForm({
    super.key,
    required this.routeName,
    required this.collection,
  });

  @override
  State<SaveRecordForm> createState() => _SaveRecordFormState();
}

class _SaveRecordFormState extends State<SaveRecordForm> {
  final _formKey = GlobalKey<FormState>();

  String? title;
  String? subtitle;
  String? category;
  String? phone;
  String? email;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    AppRouteModel routeItem = routeData[widget.routeName.path]!;

    return StoreConnector<AppState, SaveRecordProps>(
      builder: (BuildContext context, props) {
        if (props.loading == true) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Saving...',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
          );
        }
        if (props.error == true) {
          const snackBar = SnackBar(
            content: Text('Record losed :C'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (props.success != null) {
          const snackBar = SnackBar(
            content: Text('Yay! record saved! :D'),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        return Form(
          key: _formKey,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormFieldComponent(
                    labelText: localizations.t('${routeItem.path}.title.label'),
                    helperText:
                        localizations.t('${routeItem.path}.title.helper'),
                    onChanged: (value) => setState(() => title = value),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations
                            .t('${routeItem.path}.title.validator');
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormFieldComponent(
                    labelText:
                        localizations.t('${routeItem.path}.subtitle.label'),
                    helperText:
                        localizations.t('${routeItem.path}.subtitle.helper'),
                    onChanged: (value) => setState(() => subtitle = value),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations
                            .t('${routeItem.path}.subtitle.validator');
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormFieldComponent(
                    labelText:
                        localizations.t('${routeItem.path}.category.label'),
                    helperText:
                        localizations.t('${routeItem.path}.category.helper'),
                    onChanged: (value) => setState(() => category = value),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations
                            .t('${routeItem.path}.category.validator');
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormFieldComponent(
                    labelText: localizations.t('${routeItem.path}.phone.label'),
                    helperText:
                        localizations.t('${routeItem.path}.phone.helper'),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => setState(() => phone = value),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations
                            .t('${routeItem.path}.phone.validator');
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormFieldComponent(
                    labelText: localizations.t('${routeItem.path}.email.label'),
                    helperText:
                        localizations.t('${routeItem.path}.email.helper'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => setState(() => email = value),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations
                            .t('${routeItem.path}.email.validator');
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  OutlinedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                        props.saveRecord!(
                          RecordCollectionModel(
                            title: title,
                            subtitle: subtitle,
                            category: category,
                            email: email,
                            phone: phone,
                          ),
                          widget.collection,
                        );
                      }
                    },
                    icon: const Icon(Icons.app_registration_outlined),
                    label: Text(
                      localizations.t('${routeItem.path}.button'),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      converter: (Store<AppState> store) => mapStateToProps(store),
    );
  }
}

class SaveRecordProps {
  final bool? loading;
  final dynamic error;
  final RecordCollectionModel? success;
  final Function(RecordCollectionModel data, String collection)? saveRecord;

  SaveRecordProps({
    this.loading,
    this.error,
    this.success,
    this.saveRecord,
  });
}

SaveRecordProps mapStateToProps(Store<AppState> store) {
  return SaveRecordProps(
    loading: store.state.record?.loading,
    error: store.state.record?.error,
    success: store.state.record?.success,
    saveRecord: (data, collection) =>
        store.dispatch(saveRecord(data, collection)),
  );
}
