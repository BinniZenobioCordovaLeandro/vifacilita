import 'package:vifacilita/models/record_collection.model.dart';

class RecordsState {
  bool? loading;
  dynamic error;
  List<RecordCollectionModel?>? success;

  RecordsState({
    this.loading,
    this.error,
    this.success,
  });

  factory RecordsState.initial() => RecordsState(
        loading: false,
        error: null,
        success: null,
      );
}
