import 'dart:convert';

class RecordCollectionModel {
  String? title;
  String? subtitle;
  String? category;
  String? phone;
  String? email;

  RecordCollectionModel({
    this.title,
    this.subtitle,
    this.category,
    this.phone,
    this.email,
  });

  @override
  String toString() {
    return 'RecordCollectionModel(title: $title, subtitle: $subtitle, category: $category, phone: $phone, email: $email)';
  }

  factory RecordCollectionModel.fromMap(Map<String, dynamic> data) {
    return RecordCollectionModel(
      title: data['title'] as String?,
      subtitle: data['subtitle'] as String?,
      category: data['category'] as String?,
      phone: data['phone'] as String?,
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'subtitle': subtitle,
        'category': category,
        'phone': phone,
        'email': email,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RecordCollectionModel].
  factory RecordCollectionModel.fromJson(String data) {
    return RecordCollectionModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RecordCollectionModel] to a JSON string.
  String toJson() => json.encode(toMap());

  RecordCollectionModel copyWith({
    String? title,
    String? subtitle,
    String? category,
    String? phone,
    String? email,
  }) {
    return RecordCollectionModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      category: category ?? this.category,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }
}
