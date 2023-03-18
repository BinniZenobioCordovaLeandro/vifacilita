import 'dart:convert';

class HomeCardModel {
  String? icon;
  String? link;
  String? color;

  HomeCardModel({this.icon, this.link, this.color});

  @override
  String toString() {
    return 'HomeCardModel(icon: $icon, link: $link, color: $color)';
  }

  factory HomeCardModel.fromMap(Map<String, dynamic> data) => HomeCardModel(
        icon: data['icon'] as String?,
        link: data['link'] as String?,
        color: data['color'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'icon': icon,
        'link': link,
        'color': color,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HomeCardModel].
  factory HomeCardModel.fromJson(String data) {
    return HomeCardModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HomeCardModel] to a JSON string.
  String toJson() => json.encode(toMap());

  HomeCardModel copyWith({
    String? icon,
    String? link,
    String? color,
  }) {
    return HomeCardModel(
      icon: icon ?? this.icon,
      link: link ?? this.link,
      color: color ?? this.color,
    );
  }
}
