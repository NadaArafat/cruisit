import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/continent_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:meta/meta.dart';

part 'fetch_continents_state.dart';

class FetchContinentsCubit extends Cubit<FetchContinentsState> {
  FetchContinentsCubit() : super(FetchContinentsInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  fetchContinents() async {
    emit(FetchContinentsLoading());
    final collection = firestore.collection('continents');
    //get the documents
    await collection.get().then((QuerySnapshot snapshot) {
      //on empty result
      if (snapshot.docs.isEmpty) {
        emit(FetchContinentsError(message: 'No continents found'));
        log('Continents: No continents found');
      } else if (snapshot.docs.isNotEmpty) {
        List<ContinentModel> continents = [];
        for (var doc in snapshot.docs) {
          continents.add(ContinentModel.fromFirestore(doc));
        }
        emit(FetchContinentsSuccess(continents: continents));
        log('Continents found: ${snapshot.docs.length}');
      }
    });
  }
}
