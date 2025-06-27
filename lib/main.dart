import 'package:cruisit/features/authentication/data/view%20models/manager/auth_cubit.dart';
import 'package:cruisit/features/explore/presentation/loading_widgets/loading_gate.dart';
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
import 'package:cruisit/features/explore/presentation/views/explore_view.dart';
import 'package:cruisit/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const CruisitApp());
}

class CruisitApp extends StatelessWidget {
  const CruisitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FetchFeaturedDestinationsCubit()..fetchFeaturedDestinations(),
        ),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create:
              (context) =>
                  FetchAtBudgetCountriesCubit()..fetchAtBudgetCountries(),
        ),
        // BlocProvider(
        //   create:
        //       (context) => FetchNearFamousSitesCubit()..fetchNearFamousSites(),
        // ),
        BlocProvider(
          create:
              (context) =>
                  FetchVisaFreeCountriesCubit()..fetchVisaFreeCountries(),
        ),
        BlocProvider(
          create:
              (context) =>
                  FetchMostVisitedCountriesCubit()..fetchMostVisitedCountries(),
        ),
        BlocProvider(
          create:
              (context) =>
                  FetchMostPopularCitiesCubit()..fetchMostPopularCities(),
        ),
        BlocProvider(
          create:
              (context) =>
                  FetchUnfrequentedCountriesCubit()
                    ..fetchUnfrequentedCountries(),
        ),
        BlocProvider(
          create: (context) => FetchCuisinesCubit()..fetchCuisines(),
        ),
        BlocProvider(create: (context) => FetchGuidesCubit()..fetchGuides()),
        BlocProvider(
          create: (context) => FetchContinentsCubit()..fetchContinents(),
        ),
        BlocProvider(
          create: (context) => FetchHeritageSitesCubit()..fetchHeritageSites(),
        ),
        BlocProvider(create: (context) => FetchAnimalsCubit()..fetchAnimals()),
        BlocProvider(create: (context) => FetchPlantsCubit()..fetchPlants()),
        BlocProvider(
          create: (context) => FetchExperiencesCubit()..fetchExperiences(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoadingGate(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          brightness: Brightness.light,
          textTheme: GoogleFonts.rubikTextTheme(),
        ),
      ),
    );
  }
}
