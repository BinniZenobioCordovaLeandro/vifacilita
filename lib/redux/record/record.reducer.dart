import 'package:vifacilita/models/record_collection.model.dart';
import 'package:vifacilita/redux/record/record.state.dart';

RecordState recordReducer(RecordState state, dynamic action) {
  RecordState newState = state;

  switch (action.type) {
    case RECORD_REQUEST:
      newState.error = null;
      newState.loading = true;
      newState.success = null;
      return newState;

    case RECORD_SUCCESS:
      newState.error = null;
      newState.loading = false;
      newState.success =
          RecordCollectionModel.fromMap(action.payload as Map<String, dynamic>);
      return newState;

    case RECORD_FAILURE:
      newState.error = action.error;
      newState.loading = false;
      newState.success = null;
      return newState;
  }
  return newState;
}

const RECORD_REQUEST = 'RECORD_REQUEST';
const RECORD_SUCCESS = 'RECORD_SUCCESS';
const RECORD_FAILURE = 'RECORD_FAILURE';
