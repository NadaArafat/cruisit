import 'package:cruisit/features/explore/data/models/destination_model.dart';
import 'package:cruisit/features/explore/data/models/featured_model.dart';
import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer_categories_list.dart';
import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer_featured_list.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_featured_destinations/fetch_featured_destinations_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_near_famous_sites/fetch_near_famous_sites_cubit.dart';
import 'package:cruisit/features/explore/presentation/views/see_all_view.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_list.dart';
import 'package:cruisit/features/explore/presentation/widgets/featured_list.dart';
import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:cruisit/utils/helper_methods.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  
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
            BlocBuilder<
              FetchFeaturedDestinationsCubit,
              FetchFeaturedDestinationsState
            >(
              builder: (context, state) {
                if (state is FetchFeaturedDestinationsSuccess) {
                  return Column(
                    children: [
                      buildCategoryHeader(
                        title: 'Featured',
                        onSeeAllPressed: () {
                         navigateToSeeAllView(context,destinations: state.destinations, title: 'Featured');
                        },
                      ),
                      const SizedBox(height: 16),
                      FeaturedList(
                        featuredItems: state.featuredDestinations,
                        destinations: state.destinations,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            SizedBox(height: 32),
            CategoriesList(),
          ],
        ),
      ),
    );
  }


}
