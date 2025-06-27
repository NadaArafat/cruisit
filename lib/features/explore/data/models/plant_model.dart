import 'package:cloud_firestore/cloud_firestore.dart';

class PlantModel {
  final int id;
  final String name;
  final String imgUrl;
  final DocumentReference countryRef;

  PlantModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.countryRef,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      id: json['Id'] as int,
      name: json['Name'] as String,
      imgUrl: json['ImgUrl'] as String,
      countryRef: json['CountryRef'] as DocumentReference,
    );
  }
}
