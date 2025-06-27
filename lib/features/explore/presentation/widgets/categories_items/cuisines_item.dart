import 'package:cruisit/features/explore/data/models/cuisine_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_card.dart';
import 'package:cruisit/utils/helper_methods.dart';
import 'package:flutter/material.dart';

class CuisinesItem extends StatelessWidget {
  const CuisinesItem({super.key, required this.cuisine});

  final CuisineModel cuisine;

  @override
  Widget build(BuildContext context) {
    return CategoriesCard(
      imgUrl: cuisine.imgUrl,
      title: cuisine.name,
      subtitle: Row(
        children: [
          Icon(Icons.location_on, color: Colors.white, size: 12),
          SizedBox(width: 2),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    getNameFromDocumentRef(ref: cuisine.countryRef),
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
      hasSubtitle: true,
    );
  }
}
