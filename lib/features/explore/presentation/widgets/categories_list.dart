import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_animals/fetch_animals_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_cuisines/fetch_cuisines_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_experiences/fetch_experiences_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_guides/fetch_guides_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_heritage_sites/fetch_heritage_sites_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_plants/fetch_plants_cubit.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/animal_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/at_budget_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/continents_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/cuisines_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/experience_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/guides_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/heritage_site_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/most_popular_cities_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/most_visited_countries_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/plant_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/unfrequented_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/categories_items/visa_free_item.dart';
import 'package:cruisit/features/explore/presentation/widgets/featured_list.dart';
import 'package:cruisit/features/explore/presentation/widgets/horizontal_category_list.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_at_budget_countries/fetch_at_budget_countries_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_continents/fetch_continents_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_most_popular_cities/fetch_most_popular_cities_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_most_visited_countries/fetch_most_visited_countries_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_unfrequented_countries/fetch_unfrequented_countries_cubit.dart';
import 'package:cruisit/features/explore/presentation/manager/cubits/fetch_visa_free_countries/fetch_visa_free_countries_cubit.dart';
import 'package:cruisit/utils/helper_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  final List<String> categories = const [
    atYourBudget,
    visaFreeForYou,
    mostVisitedCountries,
    mostPopularCities,
    unfrequented,
    continents,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<FetchAtBudgetCountriesCubit, FetchAtBudgetCountriesState>(
          builder: (context, state) {
            if (state is FetchAtBudgetCountriesSuccess) {
              return Column(
                children: [
                  buildCategoryHeader(
                    title: atYourBudget,
                    onSeeAllPressed: () => navigateToSeeAllView(
                      context,
                      destinations: state.countries,
                      title: atYourBudget,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HorizontalCategoryList(
                      categoryItem: (item) => AtBudgetItem(country: item),
                      items: state.countries,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            }
            return const SizedBox();
          },
        ),
        BlocBuilder<FetchVisaFreeCountriesCubit, FetchVisaFreeCountriesState>(
          builder: (context, state) {
            if (state is FetchVisaFreeCountriesSuccess) {
              return Column(
                children: [
                  buildCategoryHeader(
                    title: visaFreeForYou,
                    onSeeAllPressed: () => navigateToSeeAllView(
                      context,
                      destinations: state.countries,
                      title: visaFreeForYou,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HorizontalCategoryList(
                      categoryItem: (item) => VisaFreeItem(country: item),
                      items: state.countries,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            }
            return const SizedBox();
          },
        ),

        BlocBuilder<
          FetchMostVisitedCountriesCubit,
          FetchMostVisitedCountriesState
        >(
          builder: (context, state) {
            if (state is FetchMostVisitedCountriesSuccess) {
              return Column(
                children: [
                  buildCategoryHeader(
                    title: mostVisitedCountries,
                    onSeeAllPressed: () => navigateToSeeAllView(
                      context,
                      destinations: state.countries,
                      title: mostVisitedCountries,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HorizontalCategoryList(
                      categoryItem:
                          (item) => MostVisitedCountriesItem(country: item),
                      items: state.countries,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            }
            return const SizedBox();
          },
        ),
        BlocBuilder<FetchMostPopularCitiesCubit, FetchMostPopularCitiesState>(
          builder: (context, state) {
            if (state is FetchMostPopularCitiesSuccess) {
              return Column(
                children: [
                  buildCategoryHeader(
                    title: mostPopularCities,
                    onSeeAllPressed: () => navigateToSeeAllView(
                      context,
                      destinations: state.cities,
                      title: mostPopularCities,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HorizontalCategoryList(
                      categoryItem: (item) => MostPopularCitiesItem(city: item),
                      items: state.cities,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            }
            return const SizedBox();
          },
        ),
        BlocBuilder<
          FetchUnfrequentedCountriesCubit,
          FetchUnfrequentedCountriesState
        >(
          builder: (context, state) {
            if (state is FetchUnfrequentedCountriesSuccess) {
              return Column(
                children: [
                  buildCategoryHeader(
                    title: unfrequented,
                    onSeeAllPressed: () => navigateToSeeAllView(
                      context,
                      destinations: state.countries,
                      title: unfrequented,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: HorizontalCategoryList(
                      categoryItem: (item) => UnfrequentedItem(country: item),
                      items: state.countries,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            }
            return const SizedBox();
          },
        ),
        // BlocBuilder<FetchCuisinesCubit, FetchCuisinesState>(
        //   builder: (context, state) {
        //     if (state is FetchCuisinesSuccess) {
        //       return Column(
        //         children: [
        //           buildCategoryHeader(
        //             title: "Cuisines to Savor",
        //             sectionContext: context,
        //           ),
        //           const SizedBox(height: 12),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 16.0),
        //             child: HorizontalCategoryList(
        //               categoryItem: (item) => CuisinesItem(cuisine: item),
        //               items: state.cuisines,
        //             ),
        //           ),
        //           const SizedBox(height: 24),
        //         ],
        //       );
        //     }
        //     return const SizedBox();
        //   },
        // ),
        // BlocBuilder<FetchGuidesCubit, FetchGuidesState>(
        //   builder: (context, state) {
        //     if (state is FetchGuidesSuccess) {
        //       return Column(
        //         children: [
        //           buildCategoryHeader(
        //             title: "Guides to Follow",
        //             sectionContext: context,
        //           ),
        //           const SizedBox(height: 12),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 16.0),
        //             child: HorizontalCategoryList(
        //               categoryItem: (item) => GuidesItem(guide: item),
        //               items: state.guides,
        //             ),
        //           ),
        //           const SizedBox(height: 24),
        //         ],
        //       );
        //     }
        //     return const SizedBox();
        //   },
        // ),
        // BlocBuilder<FetchHeritageSitesCubit, FetchHeritageSitesState>(
        //   builder: (context, state) {
        //     if (state is FetchHeritageSitesSuccess) {
        //       return Column(
        //         children: [
        //           buildCategoryHeader(
        //             title: "World Heritage Sites",
        //             sectionContext: context,
        //           ),
        //           const SizedBox(height: 12),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 16.0),
        //             child: HorizontalCategoryList(
        //               categoryItem: (item) => HeritageSiteItem(site: item),
        //               items: state.famousSites,
        //             ),
        //           ),
        //           const SizedBox(height: 24),
        //         ],
        //       );
        //     }
        //     return const SizedBox();
        //   },
        // ),
        // BlocBuilder<FetchContinentsCubit, FetchContinentsState>(
        //   builder: (context, state) {
        //     if (state is FetchContinentsSuccess) {
        //       return Column(
        //         children: [
        //           buildCategoryHeader(
        //             title: continents,
        //             sectionContext: context,
        //           ),
        //           const SizedBox(height: 12),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 16.0),
        //             child: HorizontalCategoryList(
        //               categoryItem: (item) => ContinentsItem(continent: item),
        //               items: state.continents,
        //             ),
        //           ),
        //           const SizedBox(height: 24),
        //         ],
        //       );
        //     }
        //     return const SizedBox();
        //   },
        // ),
        // BlocBuilder<FetchAnimalsCubit, FetchAnimalsState>(
        //   builder: (context, state) {
        //     if (state is FetchAnimalsSuccess) {
        //       return Column(
        //         children: [
        //           buildCategoryHeader(
        //             title: "Animals to Spot",
        //             sectionContext: context,
        //           ),
        //           const SizedBox(height: 12),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 16.0),
        //             child: HorizontalCategoryList(
        //               categoryItem: (item) => AnimalItem(animal: item),
        //               items: state.animals,
        //             ),
        //           ),
        //           const SizedBox(height: 24),
        //         ],
        //       );
        //     }
        //     return const SizedBox();
        //   },
        // ),
        // BlocBuilder<FetchPlantsCubit, FetchPlantsState>(
        //   builder: (context, state) {
        //     if (state is FetchPlantsSuccess) {
        //       return Column(
        //         children: [
        //           buildCategoryHeader(
        //             title: "Plants to See",
        //             sectionContext: context,
        //           ),
        //           const SizedBox(height: 12),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 16.0),
        //             child: HorizontalCategoryList(
        //               categoryItem: (item) => PlantItem(plant: item),
        //               items: state.plants,
        //             ),
        //           ),
        //           const SizedBox(height: 24),
        //         ],
        //       );
        //     }
        //     return const SizedBox();
        //   },
        // ),
        // BlocBuilder<FetchExperiencesCubit, FetchExperiencesState>(
        //   builder: (context, state) {
        //     if (state is FetchExperiencesSuccess) {
        //       return Column(
        //         children: [
        //           buildCategoryHeader(
        //             title: "Experiences",
        //             sectionContext: context,
        //           ),
        //           const SizedBox(height: 12),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 16.0),
        //             child: HorizontalCategoryList(
        //               categoryItem: (item) => ExperienceItem(experience: item),
        //               items: state.experiences,
        //             ),
        //           ),
        //           const SizedBox(height: 24),
        //         ],
        //       );
        //     }
        //     return const SizedBox();
        //   },
        // ),
      ],
    );
  }
}
