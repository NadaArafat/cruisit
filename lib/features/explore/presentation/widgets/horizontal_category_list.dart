import 'dart:developer';

import 'package:cruisit/features/authentication/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';

class HorizontalCategoryList extends StatelessWidget {
  const HorizontalCategoryList({
    super.key,
    required this.categoryItem,
    required this.items,
    required,
  });

  final Widget Function(dynamic item) categoryItem;
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190, // Fixed height for the horizontal list
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal, // List scrolls horizontally
        itemCount: 4, // Number of items in the list
        separatorBuilder:
            (_, __) => const SizedBox(width: 12), // Space between items
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 4 ? 16 : 0),
            child: categoryItem(items[index]),
          );
        },
      ),
    );
  }
}
