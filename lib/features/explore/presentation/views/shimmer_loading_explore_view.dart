import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer_categories_list.dart';
import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer_featured_list.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_featured_destinations/fetch_featured_destinations_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_near_famous_sites/fetch_near_famous_sites_cubit.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_list.dart';
import 'package:cruisit/features/explore/presentation/widgets/featured_list.dart';
import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/helper_methods.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShimmerLoadingExploreView extends StatefulWidget {
  const ShimmerLoadingExploreView({super.key});

  @override
  State<ShimmerLoadingExploreView> createState() =>
      _ShimmerLoadingExploreViewState();
}

class _ShimmerLoadingExploreViewState extends State<ShimmerLoadingExploreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFEFE),
      appBar: AppBar(
        title: Image.asset('assets/images/cruisit_logo.png', height: 36),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                buildShimmerSectionHeader(),
                const SizedBox(height: 16),
                ShimmerFeaturedList(),
              ],
            ),
            SizedBox(height: 32),
            ShimmerCategoriesList(),
          ],
        ),
      ),
    );
  }
}
