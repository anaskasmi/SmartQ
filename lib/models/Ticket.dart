import 'dart:convert';

class Ticket {
  String id;
  String agency;
  String queueLength;
  String submitedAt;
  String user;
  String validateTickets;
  String unvalidatedTickets;
  Ticket({
    this.id,
    this.agency,
    this.queueLength,
    this.submitedAt,
    this.user,
    this.validateTickets,
    this.unvalidatedTickets,
  });

  Ticket copyWith({
    String id,
    String agency,
    String queueLength,
    String submitedAt,
    String user,
    String validateTickets,
    String unvalidatedTickets,
  }) {
    return Ticket(
      id: id ?? this.id,
      agency: agency ?? this.agency,
      queueLength: queueLength ?? this.queueLength,
      submitedAt: submitedAt ?? this.submitedAt,
      user: user ?? this.user,
      validateTickets: validateTickets ?? this.validateTickets,
      unvalidatedTickets: unvalidatedTickets ?? this.unvalidatedTickets,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'agency': agency,
      'queueLength': queueLength,
      'submitedAt': submitedAt,
      'user': user,
      'validateTickets': validateTickets,
      'unvalidatedTickets': unvalidatedTickets,
    };
  }

  static Ticket fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Ticket(
      id: map['id'],
      agency: map['agency'],
      queueLength: map['queueLength'],
      submitedAt: map['submitedAt'],
      user: map['user'],
      validateTickets: map['validateTickets'],
      unvalidatedTickets: map['unvalidatedTickets'],
    );
  }

  String toJson() => json.encode(toMap());

  static Ticket fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ticket(id: $id, agency: $agency, queueLength: $queueLength, submitedAt: $submitedAt, user: $user, validateTickets: $validateTickets, unvalidatedTickets: $unvalidatedTickets)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Ticket &&
        o.id == id &&
        o.agency == agency &&
        o.queueLength == queueLength &&
        o.submitedAt == submitedAt &&
        o.user == user &&
        o.validateTickets == validateTickets &&
        o.unvalidatedTickets == unvalidatedTickets;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        agency.hashCode ^
        queueLength.hashCode ^
        submitedAt.hashCode ^
        user.hashCode ^
        validateTickets.hashCode ^
        unvalidatedTickets.hashCode;
  }
}
