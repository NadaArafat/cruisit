import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

class ShimmerFeaturedList extends StatefulWidget {
  const ShimmerFeaturedList({super.key});

  @override
  State<ShimmerFeaturedList> createState() => _ShimmerFeaturedListState();
}

class _ShimmerFeaturedListState extends State<ShimmerFeaturedList> {
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
    return ShimmerLoading(
      isLoading: true, // Set to true for loading state
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          height: 400,
          child: PageView.builder(
            controller: _pageController, // Use the page controller
            itemCount: 4, // Number of featured items
            padEnds: false, // No padding at ends
            clipBehavior: Clip.none, // Do not clip overflowing children
            physics: const BouncingScrollPhysics(), // Bouncing scroll physics
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                ), // Space between cards
                child: AnimatedBuilder(
                  animation:
                      _pageController, // Animate on page controller change
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(
                                  0,
                                  0,
                                  0,
                                  0.15,
                                ), // Card shadow color and opacity
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
