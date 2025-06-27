import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/country_model.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';

class CityModel extends DestinationModel {
  final int? numOfVisits;
  final DocumentReference? countryRef;

  CityModel({
    required super.id,
    required super.name,
    required super.imgUrl,
    this.numOfVisits,
    this.countryRef,
  });

  factory CityModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CityModel(
      name: data['Name'],
      id: data['Id'],
      imgUrl: data['ImgUrl'],
      numOfVisits: data['NumOfVisits'],
      countryRef: data['CountryRef'] as DocumentReference,
    );
  }

  Future<CountryModel> get country async {
    final doc = await countryRef!.get();
    return CountryModel.fromFirestore(doc);
  }
}
