import 'dart:developer';

import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_animals/fetch_animals_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_at_budget_countries/fetch_at_budget_countries_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_continents/fetch_continents_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_cuisines/fetch_cuisines_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_experiences/fetch_experiences_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_featured_destinations/fetch_featured_destinations_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_guides/fetch_guides_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_heritage_sites/fetch_heritage_sites_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_most_popular_cities/fetch_most_popular_cities_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_most_visited_countries/fetch_most_visited_countries_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_near_famous_sites/fetch_near_famous_sites_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_plants/fetch_plants_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_unfrequented_countries/fetch_unfrequented_countries_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_visa_free_countries/fetch_visa_free_countries_cubit.dart';
import 'package:cruisit/features/explore/presentation/views/shimmer_loading_explore_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cruisit/features/explore/presentation/views/explore_view.dart';

class LoadingGate extends StatelessWidget {
  const LoadingGate({super.key});

  bool _isAnyLoading(BuildContext context) {
    final states = [
      context.watch<FetchFeaturedDestinationsCubit>().state,
      context.watch<FetchAtBudgetCountriesCubit>().state,
      // context.watch<FetchNearFamousSitesCubit>().state,
      context.watch<FetchVisaFreeCountriesCubit>().state,
      // context.watch<FetchMostVisitedCountriesCubit>().state,
      // context.watch<FetchMostPopularCitiesCubit>().state,
      // context.watch<FetchUnfrequentedCountriesCubit>().state,
      // context.watch<FetchCuisinesCubit>().state,
      // context.watch<FetchGuidesCubit>().state,
      // context.watch<FetchContinentsCubit>().state,
      // context.watch<FetchHeritageSitesCubit>().state,
      // context.watch<FetchAnimalsCubit>().state,
      // context.watch<FetchPlantsCubit>().state,
      // context.watch<FetchExperiencesCubit>().state,
    ];

    return states.any((state) => state is BaseLoadingState);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = _isAnyLoading(context);
    log('Loading state: $isLoading');
    if (isLoading) {
      return const ShimmerLoadingExploreView();
    }

    return const ExploreView();
  }
}
