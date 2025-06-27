import 'package:cruisit/features/explore/data/models/guide_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_card.dart';
import 'package:flutter/material.dart';

class GuidesItem extends StatelessWidget {
  const GuidesItem({super.key, required this.guide});

  final GuideModel guide;

  @override
  Widget build(BuildContext context) {
    return CategoriesCard(imgUrl: guide.imgUrl, title: guide.name);
  }
}
