import 'package:cruisit/features/explore/data/models/famous_site_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_card.dart';
import 'package:flutter/material.dart';

class HeritageSiteItem extends StatelessWidget {
  const HeritageSiteItem({super.key, required this.site});

  final FamousSiteModel site;

  @override
  Widget build(BuildContext context) {
    return CategoriesCard(title: site.name, imgUrl: site.imgUrl);
  }
}
