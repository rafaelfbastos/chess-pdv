// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'authorization_model.g.dart';

@HiveType(typeId: 3)
class AuthorizationModel {
  @HiveField(0)
  final String token;
  @HiveField(1)
  final String type;

  AuthorizationModel({
    required this.token,
    required this.type,
  });
  

  AuthorizationModel copyWith({
    String? token,
    String? type,
  }) {
    return AuthorizationModel(
      token: token ?? this.token,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'type': type,
    };
  }

  factory AuthorizationModel.fromMap(Map<String, dynamic> map) {
    return AuthorizationModel(
      token: map['token'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorizationModel.fromJson(String source) => AuthorizationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthorizationModel(token: $token, type: $type)';

  @override
  bool operator ==(covariant AuthorizationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.token == token &&
      other.type == type;
  }

  @override
  int get hashCode => token.hashCode ^ type.hashCode;
}
