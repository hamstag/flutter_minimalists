import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  const AuthModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  AuthModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
  }) {
    return AuthModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});

    return result;
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthModel(id: $id, firstName: $firstName, lastName: $lastName)';

  @override
  List<Object> get props => [id, firstName, lastName];
}
