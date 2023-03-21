import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vifacilita/models/record_collection.model.dart';
import 'package:vifacilita/redux/app_state.dart';
import 'package:vifacilita/src/components/list_tile_button.dart';
import 'package:vifacilita/src/helper/launcher_link.helper.dart';

class ListRecords extends StatelessWidget {
  const ListRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ListRecordsProps>(
      builder: (BuildContext context, ListRecordsProps props) {
        if (props.loading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (props.success != null && props.success!.isNotEmpty) {
          return ListView.builder(
            itemCount: props.success!.length,
            itemBuilder: (BuildContext constext, int index) {
              RecordCollectionModel record =
                  props.success![index] as RecordCollectionModel;
              return ListTileButton(
                title: record.title,
                subtitle: '${record.subtitle} - ${record.category}',
                onTap: () => LauncherLinkHelper(url: '112').makePhoneCall(),
              );
            },
          );
        }
        return const Text('Error loading records');
      },
      converter: (Store<AppState> store) => mapStateToProps(store),
    );
  }
}

class ListRecordsProps {
  final bool? loading;
  final dynamic error;
  final List<RecordCollectionModel?>? success;

  ListRecordsProps({
    this.loading,
    this.error,
    this.success,
  });
}

ListRecordsProps mapStateToProps(Store<AppState> store) {
  return ListRecordsProps(
    loading: store.state.records?.loading,
    error: store.state.records?.error,
    success: store.state.records?.success,
  );
}
