// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

part 'pdv_model.g.dart';


@HiveType(typeId: 4)
class PdvModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String description;
  PdvModel({
    required this.id,
    required this.description,
  });
  

  PdvModel copyWith({
    int? id,
    String? description,
  }) {
    return PdvModel(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
    };
  }

  factory PdvModel.fromMap(Map<String, dynamic> map) {
    return PdvModel(
      id: map['id'] as int,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PdvModel.fromJson(String source) => PdvModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PdvModel(id: $id, description: $description)';

  @override
  bool operator ==(covariant PdvModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
