import 'package:cached_network_image/cached_network_image.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';
import 'package:cruisit/features/explore/presentation/widgets/see_all_list_view_card.dart';
import 'package:flutter/material.dart';

import '../widgets/see_all_grid_view_card.dart';

class SeeAllView extends StatefulWidget {
  const SeeAllView({
    super.key,
    required this.title,
    required this.destinations,
  });

  final String title;
  final List<DestinationModel> destinations;

  @override
  State<SeeAllView> createState() => _SeeAllViewState();
}

class _SeeAllViewState extends State<SeeAllView> {
  bool _isGrid = false;
  final List<String> countryOverviews = const [
    "The world's most populous country, known for its ancient civilization, rapid economic growth, and technological advancement.",
    "A vibrant North American nation famous for its rich cultural heritage, delicious cuisine, and beautiful beaches.",
    "South America's largest country, renowned for the Amazon rainforest, Carnival festival, and passion for football.",
    "Africa's most populous country with a diverse culture, growing economy, and significant oil reserves.",
    "Known for tango, beef, wine, and breathtaking landscapes from the Andes to Patagonia.",
    "An island nation blending ancient traditions with cutting-edge technology, known for sushi, anime, and cherry blossoms.",
    "Europe's economic powerhouse, famous for engineering, beer, and its rich historical heritage.",
    "The world's largest democracy, known for its diverse culture, IT industry, and the Taj Mahal.",
    "Home to ancient pyramids and the Nile River, with a history spanning thousands of years.",
    "A vast island continent known for its unique wildlife, stunning beaches, and the Outback.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [_buildHeader(), _buildBody()]),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(
          // Text style
          color: Colors.redAccent, // Text color
          fontSize: 20, // Font size
          fontWeight: FontWeight.bold, // Bold font
        ),
      ),

      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _buildHeader() {
    String itemsLength =
        widget.destinations.length > 1000
            ? "${widget.destinations.length / 1000}k"
            : "${widget.destinations.length}";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${widget.destinations.length}/$itemsLength",
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sort, color: Colors.redAccent, size: 24),
        ),
        const SizedBox(width: 1), // spacing between sort and view toggle
        IconButton(
          onPressed: () => setState(() => _isGrid = !_isGrid),
          icon: Icon(
            _isGrid ? Icons.view_list : Icons.grid_view,
            color: Colors.redAccent,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Expanded(child: _isGrid ? _buildGridView() : _buildListView());
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 4 / 5,
      ),
      itemBuilder: (context, index) {
        return SeeAllGridViewCard(
          destination: widget.destinations[index],
          overview: countryOverviews[index % countryOverviews.length],
        );
      },
      itemCount: widget.destinations.length,
    );
  }

  Widget _buildListView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return SeeAllListViewCard(
          destination: widget.destinations[index],
          overview: countryOverviews[index % countryOverviews.length],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: widget.destinations.length,
    );
  }
}
