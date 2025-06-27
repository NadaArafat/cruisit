import 'package:cached_network_image/cached_network_image.dart';
import 'package:cruisit/features/explore/presentation/widgets/add_button.dart';
import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer.dart';
import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key,
    required this.title,
    required this.imgUrl,
    this.subtitle,
    this.hasSubtitle = false,
  });

  final String title;
  final Widget? subtitle;
  final String imgUrl;
  final bool hasSubtitle;

  @override
  Widget build(BuildContext context) {
    List<String> name = title.split(' ');
    return AspectRatio(
      aspectRatio: 1.5 / 2,
      child: SizedBox(
        width: 200, // Fixed width for each card
        child: Align(
          alignment: Alignment.topCenter, // Aligns card to the top center
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16), // Rounds card corners
            child: Stack(
              fit: StackFit.expand, // Stack fills the available space
              children: [
                CachedNetworkImage(
                  imageUrl: imgUrl,
    
                  errorWidget:
                      (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ), // Card image
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.transparent,
                      ], // Gradient overlay
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16, // Position at the bottom
                  left: 12,
                  right: 12,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text left
                    children: [
                      name.length > 1
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name
                                    .sublist(0, name.length - 1)
                                    .join(' '), // Item title
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                softWrap: true,
                              ),
                              Text(
                                name.last, // Item title
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                          : Text(
                            title, // Item title
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      if (hasSubtitle) subtitle!,
                    ],
                  ),
                ),
                AddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
