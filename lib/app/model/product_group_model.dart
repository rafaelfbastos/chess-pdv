// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductGroupModel {
  final int id;
  final String description;
  final String code;
  final DateTime createdAt;
  final DateTime updatedAt;
  ProductGroupModel({
    required this.id,
    required this.description,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
  });

  ProductGroupModel copyWith({
    int? id,
    String? description,
    String? code,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductGroupModel(
      id: id ?? this.id,
      description: description ?? this.description,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'code': code,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory ProductGroupModel.fromMap(Map<String, dynamic> map) {
    return ProductGroupModel(
      id: map['id'] as int,
      description: map['description'] as String,
      code: map['code'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductGroupModel.fromJson(String source) => ProductGroupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductGroupModel(id: $id, description: $description, code: $code, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant ProductGroupModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description &&
      other.code == code &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      code.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}
