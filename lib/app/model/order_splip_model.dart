// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:chess_pdv/app/model/guest_model.dart';
import 'package:chess_pdv/app/model/product_model.dart';

class OrderSplipModel {
  final int? id;
  final String? tableNumber;
  final String type;
  final List<GuestModel>? guests;
  final List<ProductModel>? products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  OrderSplipModel({
    this.id,
    this.tableNumber,
    this.guests,
    this.products,
    this.createdAt,
    this.updatedAt,
    required this.type,
  });

  OrderSplipModel copyWith({
    int? id,
    String? tableNumber,
    String? type,
    List<GuestModel>? guests,
    List<ProductModel>? products,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OrderSplipModel(
      id: id ?? this.id,
      tableNumber: tableNumber ?? this.tableNumber,
      type: type ?? this.type,
      guests: guests ?? this.guests,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'table_number': tableNumber,
      'type': type,
      'guests': guests?.map((x) => x.toMap()).toList(),
      'products': products?.map((x) => x.toMap()).toList(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  factory OrderSplipModel.fromMap(Map<String, dynamic> map) {
    return OrderSplipModel(
      id: map['id'] != null ? map['id'] as int : null,
      type: map['type'] as String,
      tableNumber:
          map['table_number'] != null ? map['table_number'] as String : null,
      guests: map['guests'] != null
          ? List<GuestModel>.from(
              (map['guests'] as List<int>).map<GuestModel?>(
                (x) => GuestModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      products: map['products'] != null
          ? List<ProductModel>.from(
              (map['products'] as List<int>).map<ProductModel?>(
                (x) => ProductModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderSplipModel.fromJson(String source) =>
      OrderSplipModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderSplipModel(id: $id, tableNumber: $tableNumber, guests: $guests, products: $products, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
