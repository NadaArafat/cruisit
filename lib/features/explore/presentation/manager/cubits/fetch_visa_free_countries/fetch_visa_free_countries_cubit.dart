import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cruisit/features/explore/data/models/country_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:meta/meta.dart';

part 'fetch_visa_free_countries_state.dart';

class FetchVisaFreeCountriesCubit extends Cubit<FetchVisaFreeCountriesState> {
  FetchVisaFreeCountriesCubit() : super(FetchVisaFreeCountriesInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Fetch Visa Free For You Countries(based on user's passports)
  fetchVisaFreeCountries({List<String> passports = const ['Egypt']}) async {
    emit(FetchVisaFreeCountriesLoading());
    final collection = firestore.collection('visa_requirements');
    //Get the document references of the passports countries
    List<DocumentReference> fromCountriesRefs = [];
    for (var passport in passports) {
      final doc = await firestore.collection('countries').doc(passport).get();
      fromCountriesRefs.add(doc.reference);
    }
    //build query to get the documents where the from_country is in the fromCountriesRefs and visa_status is in visaFreeStatuses
    final visaFreeStatuses = [
      'visa-free',
      'visa-free/90 days',
      'visa-free/180 days',
      'visa-free/30 days',
      'visa-free/60 days',
      'visa-free/14 days',
    ];
    final query = collection
        .where('from_country', whereIn: fromCountriesRefs)
        .where('visa_status', whereIn: visaFreeStatuses);
    //Get the documents
    await query.get().then((QuerySnapshot snapshot) async {
      //on empty result
      if (snapshot.docs.isEmpty) {
        emit(FetchVisaFreeCountriesError(message: 'No countries found'));
        log('Visa Free For You Countries: No countries found');
        //on success
      } else if (snapshot.docs.isNotEmpty) {
        List<CountryModel> countries = [];
        //loop on docs
        for (var doc in snapshot.docs) {
          //get the to_country document
          final countryRef = doc['to_country'] as DocumentReference;
          //log(countryRef.toString());
          final countryDoc = await countryRef.get();
          //add the country to the list
          if (countryDoc.exists) {
            countries.add(CountryModel.fromFirestore(countryDoc));
          }
        }
        emit(FetchVisaFreeCountriesSuccess(countries: countries));
        log('Visa Free For You Countries found: ${countries.length}');
      }
    });
  }
}
