import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

class Agency {
  String id;
  String name;
  String address;
  int currentClientsNumber;
  int employeesNumber;
  List<double> geoLocalisation;
  List<String> services;
  Agency({
    this.id,
    this.name,
    this.address,
    this.currentClientsNumber,
    this.employeesNumber,
    this.geoLocalisation,
    this.services,
  });

  Agency copyWith({
    String id,
    String name,
    String address,
    int currentClientsNumber,
    int employeesNumber,
    List<double> geoLocalisation,
    List<String> services,
  }) {
    return Agency(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      currentClientsNumber: currentClientsNumber ?? this.currentClientsNumber,
      employeesNumber: employeesNumber ?? this.employeesNumber,
      geoLocalisation: geoLocalisation ?? this.geoLocalisation,
      services: services ?? this.services,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'currentClientsNumber': currentClientsNumber,
      'employeesNumber': employeesNumber,
      'geoLocalisation': geoLocalisation,
      'services': services,
    };
  }

  static Agency fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Agency(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      currentClientsNumber: map['currentClientsNumber'],
      employeesNumber: map['employeesNumber'],
      geoLocalisation: List<double>.from(map['geoLocalisation']),
      services: List<String>.from(map['services']),
    );
  }

  String toJson() => json.encode(toMap());

  static Agency fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Agency(id: $id, name: $name, address: $address, currentClientsNumber: $currentClientsNumber, employeesNumber: $employeesNumber, geoLocalisation: $geoLocalisation, services: $services)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Agency &&
        o.id == id &&
        o.name == name &&
        o.address == address &&
        o.currentClientsNumber == currentClientsNumber &&
        o.employeesNumber == employeesNumber &&
        listEquals(o.geoLocalisation, geoLocalisation) &&
        listEquals(o.services, services);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        currentClientsNumber.hashCode ^
        employeesNumber.hashCode ^
        geoLocalisation.hashCode ^
        services.hashCode;
  }
}
