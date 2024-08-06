// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class RoomExibhitionModel {

  final int id;
  final String description;
  final String status;
  final int? currentReserveId;
  final int currentAccommodationId;
  RoomExibhitionModel({
    required this.id,
    required this.description,
    required this.status,
    this.currentReserveId,
    required this.currentAccommodationId,
  });


  RoomExibhitionModel copyWith({
    int? id,
    String? description,
    String? status,
    int? currentReserveId,
    int? currentAccommodationId,
  }) {
    return RoomExibhitionModel(
      id: id ?? this.id,
      description: description ?? this.description,
      status: status ?? this.status,
      currentReserveId: currentReserveId ?? this.currentReserveId,
      currentAccommodationId: currentAccommodationId ?? this.currentAccommodationId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'status': status,
      'current_reserve_id': currentReserveId,
      'current_accommodation_id': currentAccommodationId,
    };
  }

  factory RoomExibhitionModel.fromMap(Map<String, dynamic> map) {
    return RoomExibhitionModel(
      id: map['id'] as int,
      description: map['description'] as String,
      status: map['status'] as String,
      currentReserveId: map['current_reserve_id'],
      currentAccommodationId: map['current_accommodation_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomExibhitionModel.fromJson(String source) => RoomExibhitionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoomExibhitionModel(id: $id, description: $description, status: $status, currentReserveId: $currentReserveId, currentAccommodationId: $currentAccommodationId)';
  }

  @override
  bool operator ==(covariant RoomExibhitionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description &&
      other.status == status &&
      other.currentReserveId == currentReserveId &&
      other.currentAccommodationId == currentAccommodationId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      status.hashCode ^
      currentReserveId.hashCode ^
      currentAccommodationId.hashCode;
  }
}
