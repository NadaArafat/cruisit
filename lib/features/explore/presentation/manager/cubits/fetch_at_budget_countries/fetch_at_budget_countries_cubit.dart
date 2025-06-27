import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/country_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:meta/meta.dart';

part 'fetch_at_budget_countries_state.dart';

class FetchAtBudgetCountriesCubit extends Cubit<FetchAtBudgetCountriesState> {
  FetchAtBudgetCountriesCubit() : super(FetchAtBudgetCountriesLoading());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Fetch At Your Budget Countries(starting price per day of the country <= budget)
  fetchAtBudgetCountries({double budget = 1500}) async {
    emit(FetchAtBudgetCountriesLoading());
    try {
      final collection = firestore.collection('countries');
      final query = collection
          .where('StartingPrice', isLessThanOrEqualTo: budget)
          .orderBy('StartingPrice', descending: true);
      await query.get().then((QuerySnapshot snapshot) {
         if (snapshot.docs.isNotEmpty) {
          List<CountryModel> countries = [];
          for (var doc in snapshot.docs) {
            countries.add(CountryModel.fromFirestore(doc));
          }
          emit(FetchAtBudgetCountriesSuccess(countries: countries));
          log('At Your Budget Countries found: ${snapshot.docs.length}');
        }
         else{
           emit(FetchAtBudgetCountriesError(message: 'No countries found'));
           log('At Your Budget Countries: No countries found');
         }
      },
      onError: (error) {
        emit(FetchAtBudgetCountriesError(message: error.toString()));
        log('Error fetching At Your Budget Countries: $error');
      });
    } catch (e) {
      emit(FetchAtBudgetCountriesError(message: e.toString()));
      log('Error fetching At Your Budget Countries: $e');
    }
  }
}
