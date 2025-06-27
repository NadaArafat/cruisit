import 'package:cruisit/features/explore/data/models/city_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_card.dart';
import 'package:cruisit/utils/helper_methods.dart';
import 'package:flutter/material.dart';

class MostPopularCitiesItem extends StatelessWidget {
  const MostPopularCitiesItem({super.key, required this.city});

  final CityModel city;

  @override
  Widget build(BuildContext context) {
    return CategoriesCard(
      imgUrl: city.imgUrl,
      title: city.name,
      hasSubtitle: true,
      subtitle: Row(
        children: [
          Icon(Icons.location_on, color: Colors.white, size: 12),
          SizedBox(width: 2),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    getNameFromDocumentRef(ref: city.countryRef),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
