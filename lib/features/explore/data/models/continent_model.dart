import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';

class ContinentModel extends DestinationModel {
  ContinentModel({
    required super.id,
    required super.name,
    required super.imgUrl,
  });

  factory ContinentModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ContinentModel(
      id: data['Id'],
      name: data['Name'],
      imgUrl: data['ImgUrl'],
    );
  }
}
