import 'dart:convert';

class AppRouteModel {
  String? path;
  String? title;
  String? button;
  String? collection;

  AppRouteModel({this.path, this.title, this.button, this.collection});

  @override
  String toString() {
    return 'AppRouteModel(path: $path, title: $title, button: $button, collection: $collection)';
  }

  factory AppRouteModel.fromMap(Map<String, dynamic> data) => AppRouteModel(
        path: data['path'] as String?,
        title: data['title'] as String?,
        button: data['button'] as String?,
        collection: data['collection'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'path': path,
        'title': title,
        'button': button,
        'collection': collection,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AppRouteModel].
  factory AppRouteModel.fromJson(String data) {
    return AppRouteModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AppRouteModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AppRouteModel copyWith({
    String? path,
    String? title,
    String? button,
    String? collection,
  }) {
    return AppRouteModel(
      path: path ?? this.path,
      title: title ?? this.title,
      button: button ?? this.button,
      collection: collection ?? this.collection,
    );
  }
}
