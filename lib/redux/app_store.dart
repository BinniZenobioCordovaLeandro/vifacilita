import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:vifacilita/redux/app_reducer.dart';
import 'package:vifacilita/redux/app_state.dart';
import 'package:vifacilita/redux/record/record.state.dart';
import 'package:vifacilita/redux/records/records.state.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState(
    record: RecordState(
      error: false,
      loading: false,
      success: null,
    ),
    records: RecordsState(
      error: false,
      loading: false,
      success: null,
    ),
  ),
  middleware: [thunkMiddleware],
);
