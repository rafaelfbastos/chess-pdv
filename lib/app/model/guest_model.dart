// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GuestModel {
  final int id;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final String name;
  final String cpf;
  final String? incompleteRegistration;
  final String? issueNfcE;
  final String? issueCfESat;
  final String? address;
  final String? complement;
  final String? number;
  final String? neighborhood;
  final String? zipcode;
  final String? ibgeCode;
  final String? homePhone;
  final String? commercialPhone;
  final String? cellPhone;
  final String? faxPhone;
  final String? infCommercial;
  final String? email;
  final String? doc;
  final String? typeDoc;
  final String? orgExp;
  final String? dateOfBirth;
  final String? gender;
  final String? maritalStatus;
  final String? naturalness;
  final String? nationality;
  final String? fatherName;
  final String? motherName;
  final String? profession;
  final String? origin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  GuestModel({
    required this.id,
    this.countryId,
    this.stateId,
    this.cityId,
    required this.name,
    required this.cpf,
    this.incompleteRegistration,
    this.issueNfcE,
    this.issueCfESat,
    this.address,
    this.complement,
    this.number,
    this.neighborhood,
    this.zipcode,
    this.ibgeCode,
    this.homePhone,
    this.commercialPhone,
    this.cellPhone,
    this.faxPhone,
    this.infCommercial,
    this.email,
    this.doc,
    this.typeDoc,
    this.orgExp,
    this.dateOfBirth,
    this.gender,
    this.maritalStatus,
    this.naturalness,
    this.nationality,
    this.fatherName,
    this.motherName,
    this.profession,
    this.origin,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  GuestModel copyWith({
    int? id,
    int? countryId,
    int? stateId,
    int? cityId,
    String? name,
    String? cpf,
    String? incompleteRegistration,
    String? issueNfcE,
    String? issueCfESat,
    String? address,
    String? complement,
    String? number,
    String? neighborhood,
    String? zipcode,
    String? ibgeCode,
    String? homePhone,
    String? commercialPhone,
    String? cellPhone,
    String? faxPhone,
    String? infCommercial,
    String? email,
    String? doc,
    String? typeDoc,
    String? orgExp,
    String? dateOfBirth,
    String? gender,
    String? maritalStatus,
    String? naturalness,
    String? nationality,
    String? fatherName,
    String? motherName,
    String? profession,
    String? origin,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return GuestModel(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      stateId: stateId ?? this.stateId,
      cityId: cityId ?? this.cityId,
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      incompleteRegistration:
          incompleteRegistration ?? this.incompleteRegistration,
      issueNfcE: issueNfcE ?? this.issueNfcE,
      issueCfESat: issueCfESat ?? this.issueCfESat,
      address: address ?? this.address,
      complement: complement ?? this.complement,
      number: number ?? this.number,
      neighborhood: neighborhood ?? this.neighborhood,
      zipcode: zipcode ?? this.zipcode,
      ibgeCode: ibgeCode ?? this.ibgeCode,
      homePhone: homePhone ?? this.homePhone,
      commercialPhone: commercialPhone ?? this.commercialPhone,
      cellPhone: cellPhone ?? this.cellPhone,
      faxPhone: faxPhone ?? this.faxPhone,
      infCommercial: infCommercial ?? this.infCommercial,
      email: email ?? this.email,
      doc: doc ?? this.doc,
      typeDoc: typeDoc ?? this.typeDoc,
      orgExp: orgExp ?? this.orgExp,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      naturalness: naturalness ?? this.naturalness,
      nationality: nationality ?? this.nationality,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      profession: profession ?? this.profession,
      origin: origin ?? this.origin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
      'name': name,
      'cpf': cpf,
      'incomplete_registration': incompleteRegistration,
      'issue_nfc_e': issueNfcE,
      'issue_cf_e_sat': issueCfESat,
      'address': address,
      'complement': complement,
      'number': number,
      'neighborhood': neighborhood,
      'zipcode': zipcode,
      'ibge_code': ibgeCode,
      'home_phone': homePhone,
      'commercial_phone': commercialPhone,
      'cell_phone': cellPhone,
      'fax_phone': faxPhone,
      'inf_commercial': infCommercial,
      'email': email,
      'doc': doc,
      'type_doc': typeDoc,
      'org_exp': orgExp,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'marital_status': maritalStatus,
      'naturalness': naturalness,
      'nationality': nationality,
      'father_name': fatherName,
      'mother_name': motherName,
      'profession': profession,
      'origin': origin,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }

  factory GuestModel.fromMap(Map<String, dynamic> map) {
    return GuestModel(
      id: map['id'] as int,
      countryId: map['country_id'] != null ? map['country_id'] as int : null,
      stateId: map['state_id'] != null ? map['state_id'] as int : null,
      cityId: map['city_id'] != null ? map['city_id'] as int : null,
      name: map['name'] as String,
      cpf: map['cpf'] as String,
      incompleteRegistration: map['incomplete_registration'] != null
          ? map['incomplete_registration'] as String
          : null,
      issueNfcE: map['issue_nfc_e'] != null ? map['issue_nfc_e'] as String : null,
      issueCfESat:
          map['issue_cf_e_sat'] != null ? map['issue_cf_e_sat'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      complement:
          map['complement'] != null ? map['complement'] as String : null,
      number: map['number'] != null ? map['number'] as String : null,
      neighborhood:
          map['neighborhood'] != null ? map['neighborhood'] as String : null,
      zipcode: map['zipcode'] != null ? map['zipcode'] as String : null,
      ibgeCode: map['ibge_code'] != null ? map['ibge_code'] as String : null,
      homePhone: map['homePhone'] != null ? map['homePhone'] as String : null,
      commercialPhone: map['commercial_phone'] != null
          ? map['commercial_phone'] as String
          : null,
      cellPhone: map['cell_phone'] != null ? map['cell_phone'] as String : null,
      faxPhone: map['fax_phone'] != null ? map['fax_phone'] as String : null,
      infCommercial:
          map['inf_commercial'] != null ? map['inf_commercial'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      doc: map['doc'] != null ? map['doc'] as String : null,
      typeDoc: map['type_doc'] != null ? map['type_doc'] as String : null,
      orgExp: map['org_exp'] != null ? map['org_exp'] as String : null,
      dateOfBirth:
          map['date_of_birth'] != null ? map['date_of_birth'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      maritalStatus:
          map['marital_status'] != null ? map['marital_status'] as String : null,
      naturalness:
          map['naturalness'] != null ? map['naturalness'] as String : null,
      nationality:
          map['nationality'] != null ? map['nationality'] as String : null,
      fatherName:
          map['father_name'] != null ? map['father_name'] as String : null,
      motherName:
          map['mother_name'] != null ? map['mother_name'] as String : null,
      profession:
          map['profession'] != null ? map['profession'] as String : null,
      origin: map['origin'] != null ? map['origin'] as String : null,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      deletedAt: map['deleted_at'] != null
          ? DateTime.parse(map['deleted_at'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GuestModel.fromJson(String source) =>
      GuestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GuestModel(id: $id, countryId: $countryId, stateId: $stateId, cityId: $cityId, name: $name, cpf: $cpf, incompleteRegistration: $incompleteRegistration, issueNfcE: $issueNfcE, issueCfESat: $issueCfESat, address: $address, complement: $complement, number: $number, neighborhood: $neighborhood, zipcode: $zipcode, ibgeCode: $ibgeCode, homePhone: $homePhone, commercialPhone: $commercialPhone, cellPhone: $cellPhone, faxPhone: $faxPhone, infCommercial: $infCommercial, email: $email, doc: $doc, typeDoc: $typeDoc, orgExp: $orgExp, dateOfBirth: $dateOfBirth, gender: $gender, maritalStatus: $maritalStatus, naturalness: $naturalness, nationality: $nationality, fatherName: $fatherName, motherName: $motherName, profession: $profession, origin: $origin, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(covariant GuestModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.countryId == countryId &&
        other.stateId == stateId &&
        other.cityId == cityId &&
        other.name == name &&
        other.cpf == cpf &&
        other.incompleteRegistration == incompleteRegistration &&
        other.issueNfcE == issueNfcE &&
        other.issueCfESat == issueCfESat &&
        other.address == address &&
        other.complement == complement &&
        other.number == number &&
        other.neighborhood == neighborhood &&
        other.zipcode == zipcode &&
        other.ibgeCode == ibgeCode &&
        other.homePhone == homePhone &&
        other.commercialPhone == commercialPhone &&
        other.cellPhone == cellPhone &&
        other.faxPhone == faxPhone &&
        other.infCommercial == infCommercial &&
        other.email == email &&
        other.doc == doc &&
        other.typeDoc == typeDoc &&
        other.orgExp == orgExp &&
        other.dateOfBirth == dateOfBirth &&
        other.gender == gender &&
        other.maritalStatus == maritalStatus &&
        other.naturalness == naturalness &&
        other.nationality == nationality &&
        other.fatherName == fatherName &&
        other.motherName == motherName &&
        other.profession == profession &&
        other.origin == origin &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        countryId.hashCode ^
        stateId.hashCode ^
        cityId.hashCode ^
        name.hashCode ^
        cpf.hashCode ^
        incompleteRegistration.hashCode ^
        issueNfcE.hashCode ^
        issueCfESat.hashCode ^
        address.hashCode ^
        complement.hashCode ^
        number.hashCode ^
        neighborhood.hashCode ^
        zipcode.hashCode ^
        ibgeCode.hashCode ^
        homePhone.hashCode ^
        commercialPhone.hashCode ^
        cellPhone.hashCode ^
        faxPhone.hashCode ^
        infCommercial.hashCode ^
        email.hashCode ^
        doc.hashCode ^
        typeDoc.hashCode ^
        orgExp.hashCode ^
        dateOfBirth.hashCode ^
        gender.hashCode ^
        maritalStatus.hashCode ^
        naturalness.hashCode ^
        nationality.hashCode ^
        fatherName.hashCode ^
        motherName.hashCode ^
        profession.hashCode ^
        origin.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode;
  }
}
