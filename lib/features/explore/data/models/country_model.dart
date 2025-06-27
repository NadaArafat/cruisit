import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/continent_model.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';

class CountryModel extends DestinationModel {
  final String? currency;
  final int? numOfVisits;
  final double? startingPrice;
  final DocumentReference? continentRef;

  CountryModel({
    required super.id,
    required super.name,
    required super.imgUrl,
    this.currency,
    this.numOfVisits,
    this.startingPrice,
    this.continentRef,
  });

  factory CountryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CountryModel(
      id: data['Id'],
      name: data['Name'],
      imgUrl: data['ImgUrl'],
      currency: data['Currency'],
      numOfVisits: data['NumOfVisits'],
      startingPrice: data['StartingPrice'],
      continentRef: data['ContinentRef'] as DocumentReference,
    );
  }

  Future<ContinentModel> get continent async {
    final doc = await continentRef!.get();
    return ContinentModel.fromFirestore(doc);
  }
}
