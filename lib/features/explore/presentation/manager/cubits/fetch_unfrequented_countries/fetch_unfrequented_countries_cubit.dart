import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/country_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:meta/meta.dart';

part 'fetch_unfrequented_countries_state.dart';

class FetchUnfrequentedCountriesCubit
    extends Cubit<FetchUnfrequentedCountriesState> {
  FetchUnfrequentedCountriesCubit()
    : super(FetchUnfrequentedCountriesInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  fetchUnfrequentedCountries() async {
    emit(FetchUnfrequentedCountriesLoading());
    final collection = firestore.collection('countries');
    //query the collection to get the documents ordered by numOfVisits in ascending order
    final query = collection.orderBy('NumOfVisits', descending: false);
    //get the documents
    await query.get().then((QuerySnapshot snapshot) {
      //on empty result
      if (snapshot.docs.isEmpty) {
        emit(FetchUnfrequentedCountriesError(message: 'No countries found'));
        log('Unfrequented Countries: No countries found');
      } else if (snapshot.docs.isNotEmpty) {
        List<CountryModel> countries = [];
        //get first 5 countries
        for (int i = 0; i < 5; i++) {
          countries.add(CountryModel.fromFirestore(snapshot.docs[i]));
        }
        emit(FetchUnfrequentedCountriesSuccess(countries: countries));
        log('Unfrequented Countries found: ${countries.length}');
      }
    });
  }
}
