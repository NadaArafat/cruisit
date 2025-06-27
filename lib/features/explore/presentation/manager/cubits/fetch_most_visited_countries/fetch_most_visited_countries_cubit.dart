import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/country_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:meta/meta.dart';

part 'fetch_most_visited_countries_state.dart';

class FetchMostVisitedCountriesCubit
    extends Cubit<FetchMostVisitedCountriesState> {
  FetchMostVisitedCountriesCubit() : super(FetchMostVisitedCountriesInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  fetchMostVisitedCountries() async {
    emit(FetchMostVisitedCountriesLoading());
    final collection = firestore.collection('countries');
    //query the collection to get the documents ordered by numOfVisits in descending order
    final query = collection.orderBy('NumOfVisits', descending: true);
    //get the documents
    await query.get().then((QuerySnapshot snapshot) {
      //on empty result
      if (snapshot.docs.isEmpty) {
        emit(FetchMostVisitedCountriesError(message: 'No countries found'));
        log('Most Visited Countries: No countries found');
        //on success
      } else if (snapshot.docs.isNotEmpty) {
        List<CountryModel> countries = [];
        //get first 12 countries
        for (int i = 0; i < 12; i++) {
          countries.add(CountryModel.fromFirestore(snapshot.docs[i]));
        }
        emit(FetchMostVisitedCountriesSuccess(countries: countries));
        log('Most Visited Countries found: ${countries.length}');
      }
    });
  }
}
