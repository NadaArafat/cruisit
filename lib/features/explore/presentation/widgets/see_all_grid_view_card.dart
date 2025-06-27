import 'package:cached_network_image/cached_network_image.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/add_button.dart';
import 'package:flutter/material.dart';

class SeeAllGridViewCard extends StatelessWidget {
  const SeeAllGridViewCard({
    super.key,
    required this.destination,
    required this.overview,
  });

  final DestinationModel destination;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          _buildImage(),
          _buildImageShadow(),
          _buildDataColumn(),
          AddButton(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Positioned.fill(
      child: CachedNetworkImage(
        imageUrl: destination.imgUrl,
        fit: BoxFit.cover,
        errorWidget: (_, __, ___) => const Icon(
          Icons.error,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildImageShadow() {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black54, Colors.transparent],
          ),
        ),
      ),
    );
  }

  Widget _buildDataColumn() {
    return Positioned(
      top: 64,
      bottom: 12,
      left: 12,
      right: 48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            destination.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            overview,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              //overflow: TextOverflow.ellipsis,
            ),
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
