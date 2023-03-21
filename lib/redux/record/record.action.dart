import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:vifacilita/models/record_collection.model.dart';
import 'package:vifacilita/redux/app_response_modal.dart';
import 'package:vifacilita/redux/app_state.dart';
import 'package:vifacilita/redux/record/record.reducer.dart';
import 'package:vifacilita/redux/records/records.action.dart';

ThunkAction<AppState> saveRecord(
  RecordCollectionModel data,
  String collectionName,
) =>
    (Store<AppState> store) {
      debugPrint('record action is running');
      store.dispatch(ResponseModal(type: RECORD_REQUEST));
      CollectionReference collection =
          FirebaseFirestore.instance.collection(collectionName);
      collection.add(data.toMap()).then((value) {
        debugPrint(value.toString());
        value.get().then(
              (value) => store.dispatch(
                ResponseModal(type: RECORD_SUCCESS, payload: value.data()),
              ),
            );
        store.dispatch(getRecords(collectionName));
      }).catchError((error) {
        debugPrint('Failed to add record: $error');
        store.dispatch(
          ResponseModal(type: RECORD_FAILURE, error: error),
        );
      });
    };
