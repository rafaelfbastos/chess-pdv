// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AccommodationItemRemovedModel {
  final int? id;
  final int accommodationId;
  final int? productId;
  final int? serviceId;
  final double quantity;
  final String? obs;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  AccommodationItemRemovedModel({
    this.id,
    required this.accommodationId,
    this.productId,
    this.serviceId,
    required this.quantity,
    this.obs,
    this.createdAt,
    this.updatedAt,
  });

  AccommodationItemRemovedModel copyWith({
    int? id,
    int? accommodationId,
    int? productId,
    int? serviceId,
    double? quantity,
    String? obs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AccommodationItemRemovedModel(
      id: id ?? this.id,
      accommodationId: accommodationId ?? this.accommodationId,
      productId: productId ?? this.productId,
      serviceId: serviceId ?? this.serviceId,
      quantity: quantity ?? this.quantity,
      obs: obs ?? this.obs,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'accommodation_id': accommodationId,
      'product_id': productId,
      'service_id': serviceId,
      'quantity': quantity,
      'obs': obs,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  factory AccommodationItemRemovedModel.fromMap(Map<String, dynamic> map) {
    return AccommodationItemRemovedModel(
      id: map['id'] as int,
      accommodationId: map['accommodation_id'] as int,
      productId: map['product_id'] != null ? map['product_id'] as int : null,
      serviceId: map['service_id'] != null ? map['service_id'] as int : null,
      quantity: map['quantity'] as double,
      obs: map['obs'] != null ? map['obs'] as String : null,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccommodationItemRemovedModel.fromJson(String source) =>
      AccommodationItemRemovedModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccommodationItemRemovedModel(id: $id, accommodationId: $accommodationId, productId: $productId, serviceId: $serviceId, quantity: $quantity, obs: $obs, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant AccommodationItemRemovedModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.accommodationId == accommodationId &&
        other.productId == productId &&
        other.serviceId == serviceId &&
        other.quantity == quantity &&
        other.obs == obs &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        accommodationId.hashCode ^
        productId.hashCode ^
        serviceId.hashCode ^
        quantity.hashCode ^
        obs.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
