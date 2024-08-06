// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:chess_pdv/app/model/guest_model.dart';
import 'package:chess_pdv/app/model/product_model.dart';

class AccommodationModel {
  final int id;
  final int roomId;
  final List<ProductModel> product;
  final List<GuestModel> guest;
  AccommodationModel({
    required this.id,
    required this.roomId,
    required this.product,
    required this.guest,
  });


  AccommodationModel copyWith({
    int? id,
    int? roomId,
    List<ProductModel>? product,
    List<GuestModel>? guest,
  }) {
    return AccommodationModel(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      product: product ?? this.product,
      guest: guest ?? this.guest,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'room_id': roomId,
      'product': product.map((x) => x.toMap()).toList(),
      'guest': guest.map((x) => x.toMap()).toList(),
    };
  }

  factory AccommodationModel.fromMap(Map<String, dynamic> map) {
    return AccommodationModel(
      id: map['id'] as int,
      roomId: map['room_id'] as int,
      product: List<ProductModel>.from((map['product']).map<ProductModel>((x) => ProductModel.fromMap(x as Map<String,dynamic>),),),
      guest: List<GuestModel>.from((map['guest']).map<GuestModel>((x) => GuestModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccommodationModel.fromJson(String source) => AccommodationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccommodationModel(id: $id, roomId: $roomId, product: $product, guest: $guest)';
  }

  @override
  bool operator ==(covariant AccommodationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.roomId == roomId &&
      listEquals(other.product, product) &&
      listEquals(other.guest, guest);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      roomId.hashCode ^
      product.hashCode ^
      guest.hashCode;
  }
}
