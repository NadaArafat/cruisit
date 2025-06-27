import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';

class FamousSiteModel extends DestinationModel {
  final bool isHeritageSite;
  final GeoPoint location;
  final String geoHash;
  final int numOfVisits;
  final DocumentReference cityRef;

  FamousSiteModel({
    required super.id,
    required super.name,
    required super.imgUrl,
    required this.isHeritageSite,
    required this.location,
    required this.geoHash,
    required this.numOfVisits,
    required this.cityRef,
  });

  factory FamousSiteModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FamousSiteModel(
      id: data['Id'].toString(),
      imgUrl: data['ImgUrl'],
      isHeritageSite: data['IsHeritageSite'],
      location: data['Location'] as GeoPoint,
      geoHash: data['GeoHash'],
      name: data['Name'],
      numOfVisits: data['NumOfVisits'],
      cityRef: data['CityRef'] as DocumentReference,
    );
  }
}
