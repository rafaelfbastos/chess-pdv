// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class ProductPivot {

  final int accommodationId;
  final int productId;
  final int quantity;
  final int pdvId;
  ProductPivot({
    required this.accommodationId,
    required this.productId,
    required this.quantity,
    required this.pdvId,
  });

  ProductPivot copyWith({
    int? accommodationId,
    int? productId,
    int? quantity,
    int? pdvId,
  }) {
    return ProductPivot(
      accommodationId: accommodationId ?? this.accommodationId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      pdvId: pdvId ?? this.pdvId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accommodation_id': accommodationId,
      'product_id': productId,
      'quantity': quantity,
      'pdv_id': pdvId,
    };
  }

  factory ProductPivot.fromMap(Map<String, dynamic> map) {
    return ProductPivot(
      accommodationId: map['accommodation_id'] as int,
      productId: map['product_id'] as int,
      quantity: map['quantity'] as int,
      pdvId: map['pdv_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductPivot.fromJson(String source) => ProductPivot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductPivot(accommodationId: $accommodationId, productId: $productId, quantity: $quantity, pdvId: $pdvId)';
  }

  @override
  bool operator ==(covariant ProductPivot other) {
    if (identical(this, other)) return true;
  
    return 
      other.accommodationId == accommodationId &&
      other.productId == productId &&
      other.quantity == quantity &&
      other.pdvId == pdvId;
  }

  @override
  int get hashCode {
    return accommodationId.hashCode ^
      productId.hashCode ^
      quantity.hashCode ^
      pdvId.hashCode;
  }
}
