import 'dart:developer';

import 'package:cruisit/features/explore/data/models/continent_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_card.dart';
import 'package:flutter/material.dart';

class ContinentsItem extends StatelessWidget {
  const ContinentsItem({super.key, required this.continent});

  final ContinentModel continent;

  @override
  Widget build(BuildContext context) {
    return CategoriesCard(imgUrl: continent.imgUrl, title: continent.name);
  }
}
