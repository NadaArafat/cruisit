import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class CuisineModel {
  final int id;
  final String name;
  final String imgUrl;
  final DocumentReference countryRef;

  CuisineModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.countryRef,
  });

  factory CuisineModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CuisineModel(
      id: data['Id'],
      name: data['Name'],
      imgUrl: data['ImgUrl'],
      countryRef: data['CountryRef'],
    );
  }
}
