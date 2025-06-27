import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';

class FamousSiteModel extends DestinationModel {
  final bool isHeritageSite;
  final double latitude;
  final double longitude;
  final int numOfVisits;
  final DocumentReference cityRef;

  FamousSiteModel({
    required super.id,
    required super.name,
    required super.imgUrl,
    required this.isHeritageSite,
    required this.latitude,
    required this.longitude,
    required this.numOfVisits,
    required this.cityRef,
  });

  factory FamousSiteModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FamousSiteModel(
      id: data['Id'],
      imgUrl: data['ImgUrl'],
      isHeritageSite: data['IsHeritageSite'],
      latitude: data['Latitude'],
      longitude: data['Longitude'],
      name: data['Name'],
      numOfVisits: data['NumOfVisits'],
      cityRef: data['CityRef'] as DocumentReference,
    );
  }
}
