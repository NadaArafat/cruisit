import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalModel {
  final int id;
  final String name;
  final String imgUrl;
  final DocumentReference countryRef;
  final DocumentReference continentRef;

  AnimalModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.countryRef,
    required this.continentRef,
  });

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
      id: json['Id'] as int,
      name: json['Name'] as String,
      imgUrl: json['ImgUrl'] as String,
      countryRef: json['CountryRef'] as DocumentReference,
      continentRef: json['ContinentRef'] as DocumentReference,
    );
  }
}
