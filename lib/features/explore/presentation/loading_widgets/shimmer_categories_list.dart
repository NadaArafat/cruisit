import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer_category_card.dart';
import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer_loading.dart';
import 'package:cruisit/utils/helper_methods.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:flutter/material.dart';

class ShimmerCategoriesList extends StatelessWidget {
  const ShimmerCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: ListView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              buildShimmerSectionHeader(),

              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  height: 190, // Fixed height for the horizontal list
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection:
                        Axis.horizontal, // List scrolls horizontally
                    itemCount: 4, // Number of items in the list
                    separatorBuilder:
                        (_, __) =>
                            const SizedBox(width: 12), // Space between items
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: index == 4 ? 16 : 0),
                        child: ShimmerCategoryCard(),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }
}

Widget buildShimmerSectionHeader() {
  return ShimmerLoading(
    isLoading: true,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    ),
  );
}
