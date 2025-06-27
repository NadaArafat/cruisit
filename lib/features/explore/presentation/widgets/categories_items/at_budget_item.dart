import 'dart:developer';

import 'package:cruisit/features/authentication/presentation/views/sign_in_view.dart';
import 'package:cruisit/features/explore/data/models/country_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_card.dart';
import 'package:flutter/material.dart';

class AtBudgetItem extends StatelessWidget {
  const AtBudgetItem({super.key, required this.country});

  final CountryModel country;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("at budget item clicked");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return SignInView();
            },
          ),
        );
      },
      child: CategoriesCard(
        imgUrl: country.imgUrl,
        title: country.name,
        subtitle: Text(
          'Starting \$${country.startingPrice?.toInt()}/day',
          style: const TextStyle(color: Colors.white, fontSize: 12),
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        hasSubtitle: true,
      ),
    );
  }
}
