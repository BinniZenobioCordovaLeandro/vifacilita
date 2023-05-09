import 'package:vifacilita/models/record_collection.model.dart';

class RecordState {
  bool? loading;
  dynamic error;
  RecordCollectionModel? success;

  RecordState({
    this.loading,
    this.error,
    this.success,
  });

  factory RecordState.initial() => RecordState(
        loading: false,
        error: null,
        success: null,
      );
}
