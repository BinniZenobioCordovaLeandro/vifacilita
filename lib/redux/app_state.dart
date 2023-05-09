import 'package:vifacilita/redux/record/record.state.dart';
import 'package:vifacilita/redux/records/records.state.dart';

class AppState {
  final RecordState? record;
  final RecordsState? records;

  AppState({
    this.record,
    this.records,
  });

  factory AppState.initial() => AppState(
        record: RecordState.initial(),
        records: RecordsState.initial(),
      );

  AppState copyWith({
    RecordState? record,
    RecordsState? records,
  }) =>
      AppState(
        record: record ?? this.record,
        records: records ?? this.records,
      );
}
