import 'dart:convert';

class HomeCardModel {
  String? icon;
  String? link;
  String? color;
  String? title;

  HomeCardModel({this.icon, this.link, this.color, this.title});

  @override
  String toString() {
    return 'HomeCardModel(icon: $icon, link: $link, color: $color, title: $title)';
  }

  factory HomeCardModel.fromMap(Map<String, dynamic> data) => HomeCardModel(
        icon: data['icon'] as String?,
        link: data['link'] as String?,
        color: data['color'] as String?,
        title: data['title'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'icon': icon,
        'link': link,
        'color': color,
        'title': title,
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
    String? title,
  }) {
    return HomeCardModel(
      icon: icon ?? this.icon,
      link: link ?? this.link,
      color: color ?? this.color,
      title: title ?? this.title,
    );
  }
}
