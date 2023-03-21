import 'package:vifacilita/redux/app_state.dart';
import 'package:vifacilita/redux/record/record.reducer.dart';
import 'package:vifacilita/redux/records/records.reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    record: recordReducer(state.record!, action),
    records: recordsReducer(state.records!, action),
  );
}
