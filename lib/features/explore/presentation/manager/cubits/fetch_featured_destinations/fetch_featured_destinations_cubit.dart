import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/city_model.dart';
import 'package:cruisit/features/explore/data/models/country_model.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';
import 'package:cruisit/features/explore/data/models/famous_site_model.dart';
import 'package:cruisit/features/explore/data/models/featured_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:cruisit/features/explore/presentation/widgets/featured_list.dart';
import 'package:meta/meta.dart';

part 'fetch_featured_destinations_state.dart';

class FetchFeaturedDestinationsCubit
    extends Cubit<FetchFeaturedDestinationsState> {
  FetchFeaturedDestinationsCubit() : super(FetchFeaturedDestinationsInitial());

  final _firestore = FirebaseFirestore.instance;
  List<FeaturedModel> featuredList = [];
  List<DestinationModel> destinationList = [];

  Future<void> fetchFeaturedDestinations() async {
    emit(FetchFeaturedDestinationsLoading());
    _firestore.collection('featured').get().then((snapshot) async {
      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          final featured = FeaturedModel.fromFirestore(doc);
          featuredList.add(FeaturedModel.fromFirestore(doc));
          final typeRefDoc = await featured.typeRef.get();
          if (featured.type == "Country") {
            destinationList.add(CountryModel.fromFirestore(typeRefDoc));
          } else if (featured.type == "City") {
            destinationList.add(CityModel.fromFirestore(typeRefDoc));
          } else if (featured.type == "FamousSite") {
            destinationList.add(FamousSiteModel.fromFirestore(typeRefDoc));
          }
        }
        emit(
          FetchFeaturedDestinationsSuccess(
            featuredDestinations: featuredList,
            destinations: destinationList,
          ),
        );
        log("Featured Destinations found: ${featuredList.length}");
      }
    });
  }
}
