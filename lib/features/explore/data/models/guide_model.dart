import 'package:cloud_firestore/cloud_firestore.dart';

class GuideModel {
  final int id;
  final String name;
  final String imgUrl;
  final String describtion;

  GuideModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.describtion,
  });

    factory GuideModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return GuideModel(
      name: data['Name'],
      id: data['Id'],
      imgUrl: data['ImgUrl'],
    describtion: data['Description']
    );
  }
}
