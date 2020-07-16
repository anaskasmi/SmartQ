import 'dart:convert';

class Service {
  String id;
  String agency;
  String title;
  Service({
    this.id: "id",
    this.agency: "agency",
    this.title: "title",
  });

  Service copyWith({
    String id,
    String agency,
    String title,
  }) {
    return Service(
      id: id ?? this.id,
      agency: agency ?? this.agency,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'agency': agency,
      'title': title,
    };
  }

  static Service fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Service(
      id: map['id'],
      agency: map['agency'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  static Service fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Service(id: $id, agency: $agency, title: $title)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Service && o.id == id && o.agency == agency && o.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ agency.hashCode ^ title.hashCode;
}
