import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:vifacilita/redux/app_response_modal.dart';
import 'package:vifacilita/redux/app_state.dart';
import 'package:vifacilita/redux/records/records.reducer.dart';

ThunkAction<AppState> getRecords(String collectionName) =>
    (Store<AppState> store) {
      debugPrint('getRecords action is running');
      store.dispatch(ResponseModal(type: RECORDS_REQUEST));
      CollectionReference collection =
          FirebaseFirestore.instance.collection(collectionName);
      collection.get().then((value) {
        debugPrint(value.toString());
        var data = value.docs.map((doc) => doc.data()).toList();
        store.dispatch(ResponseModal(type: RECORDS_SUCCESS, payload: data));
      }).catchError((error) {
        debugPrint('Failed to add getRecords: $error');
        store.dispatch(ResponseModal(type: RECORDS_FAILURE, error: error));
      });
    };
