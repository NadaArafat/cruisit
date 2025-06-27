import 'package:cruisit/features/explore/data/models/plant_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_card.dart';
import 'package:flutter/material.dart';

class PlantItem extends StatelessWidget {
  const PlantItem({super.key, required this.plant});

  final PlantModel plant;

  @override
  Widget build(BuildContext context) {
    return CategoriesCard(title: plant.name, imgUrl: plant.imgUrl);
  }
}
