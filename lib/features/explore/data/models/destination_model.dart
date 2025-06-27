import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DestinationModel {
  final String id;
  final String name;
  final String imgUrl;

  DestinationModel({
    required this.id,
    required this.name,
    required this.imgUrl,
  });
}
