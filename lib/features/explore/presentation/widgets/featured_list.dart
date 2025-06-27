import 'dart:developer';

import 'package:cruisit/features/explore/data/models/destination_model.dart';
import 'package:cruisit/features/explore/data/models/featured_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/featured_card.dart';
import 'package:flutter/material.dart';
import 'package:rotating_carousel/rotating_carousel.dart';

class FeaturedList extends StatefulWidget {
  const FeaturedList({
    super.key,
    required this.featuredItems,
    required this.destinations,
  });

  final List<FeaturedModel> featuredItems;
  final List<DestinationModel> destinations;

  @override
  State<FeaturedList> createState() => _FeaturedListState();
}

class _FeaturedListState extends State<FeaturedList> {
  final PageController _pageController = PageController(
    viewportFraction: 0.75,
  ); // Page controller for featured cards, 80% viewport

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: RotatingCarousel(
//         panels: List.generate(4, (index) {
//           return FeaturedCard(
//             featuredItem: widget.featuredItems[index],
//             destinationItem: widget.destinations[index],
//           );
//         }),
//         height: 350,
//         width: 450,
//         minRatio: 0.9,
//         overlapRatio: 0.7,
//         animationDurationInMilliseconds: 100,
//       ),
//     );
//   }
// }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 400,
        child: PageView.builder(
          controller: _pageController, // Use the page controller
          itemCount: widget.featuredItems.length, // Number of featured items
          padEnds: false, // No padding at ends
          clipBehavior: Clip.none, // Do not clip overflowing children
          physics: const BouncingScrollPhysics(), // Bouncing scroll physics
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16), // Space between cards
              child: AnimatedBuilder(
                animation: _pageController, // Animate on page controller change
                builder: (context, child) {
                  double currentPage = 0.0; // Track current page
                  if (_pageController.hasClients &&
                      _pageController.position.haveDimensions) {
                    currentPage =
                        _pageController.page ??
                        _pageController.initialPage
                            .toDouble(); // Get current page
                  }

                  final delta =
                      index - currentPage; // Difference from current page
                  final scale = (1 - delta.abs() * 0.1).clamp(
                    0.9,
                    1.0,
                  ); // Scale cards based on position

                  return Transform.translate(
                    offset: Offset(
                      delta * -20,
                      delta.abs() * 8,
                    ), // Shift cards for parallax
                    child: Transform.scale(
                      scale: scale, // Scale card
                      child: FeaturedCard(
                        featuredItem: widget.featuredItems[index],
                        destinationItem: widget.destinations[index],
                      ), // Build the card
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
