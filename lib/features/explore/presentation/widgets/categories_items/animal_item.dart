import 'package:cruisit/features/explore/data/models/animal_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_card.dart';
import 'package:flutter/material.dart';

class AnimalItem extends StatelessWidget {
  const AnimalItem({super.key, required this.animal});

  final AnimalModel animal;

  @override
  Widget build(BuildContext context) {
    return CategoriesCard(title: animal.name, imgUrl: animal.imgUrl);
  }
}
