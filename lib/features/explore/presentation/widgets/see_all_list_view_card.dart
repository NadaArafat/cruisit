import 'package:cached_network_image/cached_network_image.dart';
import 'package:cruisit/features/explore/data/models/country_model.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';
import 'package:flutter/material.dart';

class SeeAllListViewCard extends StatelessWidget {
  const SeeAllListViewCard({super.key, required this.destination, required this.overview});

  final DestinationModel destination;
  final String overview;

  @override
  Widget build(BuildContext context){
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1, // Card elevation
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(children: [_buildDataColumn(), _buildImage()]),
      ),
    ); // Padding inside the card
  }

  Widget _buildDataColumn() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            destination.name,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            overview,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          const SizedBox(height: 8),
          _buildIndicatorsRow(),
        ],
      ),
    );
  }

  Widget _buildIndicatorsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildReviewsIndicator(rating: "4.5"),
        SizedBox(width: 12),
        _buildIndicator(
          icon: Icons.attach_money,
          // value:
          //     "From \$29",
          color: Colors.green,
        ),
        SizedBox(width: 12),
        _buildIndicator(icon: Icons.shield, color: Colors.blueGrey),
        SizedBox(width: 12),
        _buildIndicator(icon: Icons.directions_walk, color: Colors.deepOrange),
      ],
    );
  }

  _buildReviewsIndicator({required String rating}) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: (){
        //ToDo: Handle tap if needed
      },
      child: Row(
        children: [
          Text('4.5', style: TextStyle(fontSize: 12, color: Colors.black87)),
          SizedBox(width: 2),
          Icon(Icons.star, color: Colors.amber, size: 16),
        ],
      ),
    );
  }

  _buildIndicator({
    required IconData icon,
    required MaterialColor color,
    String value = "",
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        //ToDo: Handle tap if needed
      },
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          SizedBox(width: 2),
          Text(value, style: TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      // Clip image with rounded corners
      borderRadius: BorderRadius.circular(8), // Border radius
      child: CachedNetworkImage(
        imageUrl: destination.imgUrl, // Image path
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        errorWidget: (_, __, ___) => const Icon(Icons.error,color: Colors.grey,),
      ), // End Image.asset
    );
  }
}
