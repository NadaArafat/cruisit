import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/city_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:meta/meta.dart';

part 'fetch_most_popular_cities_state.dart';

class FetchMostPopularCitiesCubit extends Cubit<FetchMostPopularCitiesState> {
  FetchMostPopularCitiesCubit() : super(FetchMostPopularCitiesInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  fetchMostPopularCities() async {
    emit(FetchMostPopularCitiesLoading());
    final collection = firestore.collection('cities');
    //query the collection to get the documents ordered by numOfVisits in descending order
    final query = collection.orderBy('NumOfVisits', descending: true);
    //get the documents
    await query.get().then((QuerySnapshot snapshot) {
      //on empty result
      if (snapshot.docs.isEmpty) {
        emit(FetchMostPopularCitiesError(message: 'No cities found'));
        log('Most Popular Cities: No cities found');
        //on success
      } else if (snapshot.docs.isNotEmpty) {
        List<CityModel> cities = [];
        //get first 12 cities
        for (int i = 0; i < 12; i++) {
          cities.add(CityModel.fromFirestore(snapshot.docs[i]));
        }
        emit(FetchMostPopularCitiesSuccess(cities: cities));
        log('Most Popular Cities found: ${cities.length}');
      }
    });
  }
}
