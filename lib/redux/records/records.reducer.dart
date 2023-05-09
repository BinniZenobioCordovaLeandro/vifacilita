import 'package:vifacilita/models/record_collection.model.dart';
import 'package:vifacilita/redux/records/records.state.dart';

RecordsState recordsReducer(RecordsState state, dynamic action) {
  RecordsState newState = state;

  switch (action.type) {
    case RECORDS_REQUEST:
      newState.error = null;
      newState.loading = true;
      newState.success = null;
      return newState;

    case RECORDS_SUCCESS:
      List<RecordCollectionModel?>? recordsList = [];
      for (var doc in action.payload) {
        var record = RecordCollectionModel.fromMap(doc as Map<String, dynamic>);
        recordsList.add(record);
      }
      newState.error = null;
      newState.loading = false;
      newState.success = recordsList;
      return newState;

    case RECORDS_FAILURE:
      newState.error = action.error;
      newState.loading = false;
      newState.success = null;
      return newState;
  }
  return newState;
}

const RECORDS_REQUEST = 'RECORDS_REQUEST';
const RECORDS_SUCCESS = 'RECORDS_SUCCESS';
const RECORDS_FAILURE = 'RECORDS_FAILURE';
