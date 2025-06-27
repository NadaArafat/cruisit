import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';
import 'package:cruisit/features/explore/data/models/featured_model.dart';
import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

import '../../../info/presentation/views/featured_details_view.dart';

class FeaturedCard extends StatefulWidget {
  const FeaturedCard({
    super.key,
    required this.featuredItem,
    required this.destinationItem,
  });

  final FeaturedModel featuredItem;
  final DestinationModel destinationItem;

  @override
  State<FeaturedCard> createState() => _FeaturedCardState();
}

bool isFavorite = false;

class _FeaturedCardState extends State<FeaturedCard> {
  @override
  Widget build(BuildContext context) {
    List<String> title = widget.featuredItem.title.split(' ');
    return GestureDetector(
      onTap: (){
        log("clicked");
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => FeaturedDetailsView(),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), // Card corners rounded
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(36), // Round the image corners
          child: Stack(
            fit: StackFit.expand, // Stack expands to fill card
            children: [
              CachedNetworkImage(
                imageUrl: widget.destinationItem.imgUrl,
                fit: BoxFit.cover,

                errorWidget: (context, url, error) => const Icon(Icons.error),
              ), // Background image
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black38,
                    ], // Overlay gradient
                  ),
                ),
              ),
              Positioned(
                left: 28,
                bottom: 24,
                right: 28,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to left
                  children: [
                    title.length > 1
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title
                                  .sublist(0, title.length - 1)
                                  .join(' '), // Item title
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                              softWrap: true,
                            ),
                            Text(
                              title.last, // Item title
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                        : Text(
                          title.first, // Item title
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.white,
                        ), // Location icon
                        const SizedBox(width: 4), // Space between icon and text
                        Text(
                          widget.featuredItem.subtitle, // Card subtitle
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 28,
                bottom: 24,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite
                        ? Icons
                            .favorite // filled heart
                        : Icons.favorite_border, // outlined
                    color: isFavorite ? Colors.redAccent : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
