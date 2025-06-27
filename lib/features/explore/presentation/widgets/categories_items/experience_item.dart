import 'package:cruisit/features/explore/data/models/experience_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_card.dart';
import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key, required this.experience});

  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    return CategoriesCard(title: experience.name, imgUrl: experience.imgUrl);
  }
}
