import 'package:cruisit/features/explore/data/models/country_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_card.dart';
import 'package:flutter/material.dart';

class MostVisitedCountriesItem extends StatelessWidget {
  const MostVisitedCountriesItem({super.key, required this.country});

  final CountryModel country;

  @override
  Widget build(BuildContext context) {
    return CategoriesCard(imgUrl: country.imgUrl, title: country.name);
  }
}
