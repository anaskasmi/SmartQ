import 'dart:convert';

class User {
  String id;
  String name;
  String email;
  String phoneNumber;
  String reputation;
  String submitedTickets;
  String validateTickets;
  String unvalidatedTickets;
  User({
    this.id: "id",
    this.name: "name",
    this.email: "email",
    this.phoneNumber: "phoneNumber",
    this.reputation: "reputation",
    this.submitedTickets: "submitedTickets",
    this.validateTickets: "validateTickets",
    this.unvalidatedTickets: "unvalidatedTickets",
  });

  User copyWith({
    String id,
    String name,
    String email,
    String phoneNumber,
    String reputation,
    String submitedTickets,
    String validateTickets,
    String unvalidatedTickets,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      reputation: reputation ?? this.reputation,
      submitedTickets: submitedTickets ?? this.submitedTickets,
      validateTickets: validateTickets ?? this.validateTickets,
      unvalidatedTickets: unvalidatedTickets ?? this.unvalidatedTickets,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'reputation': reputation,
      'submitedTickets': submitedTickets,
      'validateTickets': validateTickets,
      'unvalidatedTickets': unvalidatedTickets,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      reputation: map['reputation'],
      submitedTickets: map['submitedTickets'],
      validateTickets: map['validateTickets'],
      unvalidatedTickets: map['unvalidatedTickets'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, reputation: $reputation, submitedTickets: $submitedTickets, validateTickets: $validateTickets, unvalidatedTickets: $unvalidatedTickets)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.id == id &&
        o.name == name &&
        o.email == email &&
        o.phoneNumber == phoneNumber &&
        o.reputation == reputation &&
        o.submitedTickets == submitedTickets &&
        o.validateTickets == validateTickets &&
        o.unvalidatedTickets == unvalidatedTickets;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        reputation.hashCode ^
        submitedTickets.hashCode ^
        validateTickets.hashCode ^
        unvalidatedTickets.hashCode;
  }
}
