import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/famous_site_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'fetch_near_famous_sites_state.dart';

class FetchNearFamousSitesCubit extends Cubit<FetchNearFamousSitesState> {
  FetchNearFamousSitesCubit() : super(FetchNearFamousSitesInitial());

  fetchNearFamousSites({required Position userLocation}) async {
    emit(FetchNearFamousSitesLoading());
    try {
      await firestore
          .collection('famous_sites')
          .where(
            'location',
            isGreaterThan: GeoPoint(
              userLocation.latitude - 0.1,
              userLocation.longitude - 0.1,
            ),
          )
          .where(
            'location',
            isLessThan: GeoPoint(
              userLocation.latitude + 0.1,
              userLocation.longitude + 0.1,
            ),
          )
          .get()
          .then((value) {
            final famousSites =
                value.docs
                    .map((doc) => FamousSiteModel.fromFirestore(doc))
                    .toList();
            emit(FetchNearFamousSitesSuccess(famousSites: famousSites));
          });
    } catch (e) {
      log('Error fetching near famous sites: $e');
      emit(
        FetchNearFamousSitesError(
          message: 'Failed to fetch near famous sites: $e',
        ),
      );
    }
  }
}
