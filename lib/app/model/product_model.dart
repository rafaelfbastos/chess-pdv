// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:chess_pdv/app/model/product_group_model.dart';

class ProductModel with CustomDropdownListFilter {
  final int id;
  final int chessProductId;
  final int groupProductsId;
  final int unitsId;
  final String code;
  final String description;
  final double unitCost;
  final double salePrice;
  final double contributionMargin;
  final double costsContributionMarginPercent;
  final int isProduct;
  final String? ncm;
  final String? cfop;
  final String active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String text;
  final ProductGroupModel group;

  ProductModel({
    required this.id,
    required this.chessProductId,
    required this.groupProductsId,
    required this.unitsId,
    required this.code,
    required this.description,
    required this.unitCost,
    required this.salePrice,
    required this.contributionMargin,
    required this.costsContributionMarginPercent,
    required this.isProduct,
    this.ncm,
    this.cfop,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.text,
    required this.group,
  });

  ProductModel copyWith({
    int? id,
    int? chessProductId,
    int? groupProductsId,
    int? unitsId,
    String? code,
    String? description,
    double? unitCost,
    double? salePrice,
    double? contributionMargin,
    double? costsContributionMarginPercent,
    int? isProduct,
    String? ncm,
    String? cfop,
    String? active,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? text,
    ProductGroupModel? group,
  }) {
    return ProductModel(
      id: id ?? this.id,
      chessProductId: chessProductId ?? this.chessProductId,
      groupProductsId: groupProductsId ?? this.groupProductsId,
      unitsId: unitsId ?? this.unitsId,
      code: code ?? this.code,
      description: description ?? this.description,
      unitCost: unitCost ?? this.unitCost,
      salePrice: salePrice ?? this.salePrice,
      contributionMargin: contributionMargin ?? this.contributionMargin,
      costsContributionMarginPercent:
          costsContributionMarginPercent ?? this.costsContributionMarginPercent,
      isProduct: isProduct ?? this.isProduct,
      ncm: ncm ?? this.ncm,
      cfop: cfop ?? this.cfop,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      text: text ?? this.text,
      group: group ?? this.group,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'chess_product_id': chessProductId,
      'group_products_id': groupProductsId,
      'units_id': unitsId,
      'code': code,
      'description': description,
      'unit_cost': unitCost,
      'sale_price': salePrice,
      'contribution_margin': contributionMargin,
      'costs_contribution_margin_percent': costsContributionMarginPercent,
      'is_product': isProduct,
      'ncm': ncm,
      'cfop': cfop,
      'active': active,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'text': text,
      'group': group.toMap(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      chessProductId: map['chess_product_id'] as int,
      groupProductsId: map['group_products_id'] as int,
      unitsId: map['units_id'] as int,
      code: map['code'] as String,
      description: map['description'] as String,
      unitCost: map['unit_cost'] as double,
      salePrice: map['sale_price'] as double,
      contributionMargin: map['contribution_margin'] as double,
      costsContributionMarginPercent:
          map['costs_contribution_margin_percent'] as double,
      isProduct: map['is_product'] as int,
      ncm: map['ncm'],
      cfop: map['cfop'],
      active: map['active'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      text: map['text'] as String,
      group: ProductGroupModel.fromMap(map['group'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => text;

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.chessProductId == chessProductId &&
        other.groupProductsId == groupProductsId &&
        other.unitsId == unitsId &&
        other.code == code &&
        other.description == description &&
        other.unitCost == unitCost &&
        other.salePrice == salePrice &&
        other.contributionMargin == contributionMargin &&
        other.costsContributionMarginPercent ==
            costsContributionMarginPercent &&
        other.isProduct == isProduct &&
        other.ncm == ncm &&
        other.cfop == cfop &&
        other.active == active &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.text == text &&
        other.group == group;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        chessProductId.hashCode ^
        groupProductsId.hashCode ^
        unitsId.hashCode ^
        code.hashCode ^
        description.hashCode ^
        unitCost.hashCode ^
        salePrice.hashCode ^
        contributionMargin.hashCode ^
        costsContributionMarginPercent.hashCode ^
        isProduct.hashCode ^
        ncm.hashCode ^
        cfop.hashCode ^
        active.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        text.hashCode ^
        group.hashCode;
  }

  @override
  bool filter(String query) {
    return text.toLowerCase().contains(query.toLowerCase());
  }
}
