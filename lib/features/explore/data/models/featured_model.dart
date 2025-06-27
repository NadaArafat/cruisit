import 'package:cloud_firestore/cloud_firestore.dart';

class FeaturedModel {
  final int id;
  final String title;
  final String subtitle;
  final String type;
  final DocumentReference typeRef;

  FeaturedModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.typeRef,
  });

  factory FeaturedModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FeaturedModel(
      id: data['Id'],
      title: data['Title'],
      subtitle: data['Subtitle'],
      type: data['Type'],
      typeRef: data['TypeRef'] as DocumentReference,
    );
  }
}
