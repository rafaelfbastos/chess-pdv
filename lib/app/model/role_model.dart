// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'role_model.g.dart';

@HiveType(typeId: 2)
class RoleModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  RoleModel({
    required this.id,
    required this.name,
  });
  

  RoleModel copyWith({
    int? id,
    String? name,
  }) {
    return RoleModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleModel.fromJson(String source) => RoleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RoleModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant RoleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
