import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cruisit/features/explore/data/models/famous_site_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:meta/meta.dart';

part 'fetch_heritage_sites_state.dart';

class FetchHeritageSitesCubit extends Cubit<FetchHeritageSitesState> {
  FetchHeritageSitesCubit() : super(FetchHeritageSitesInitial());

  Future<void> fetchHeritageSites() async {
    await firestore
        .collection('famousSites')
        .where('IsHeritageSite', isEqualTo: true)
        .get()
        .then(
          (snapshot) {
            if (snapshot.docs.isNotEmpty) {
              List<FamousSiteModel> famousSites =
                  snapshot.docs
                      .map((doc) => FamousSiteModel.fromFirestore(doc))
                      .toList();
              emit(FetchHeritageSitesSuccess(famousSites: famousSites));
              log('Fetched heritage sites: ${famousSites.length}');
            }
          },
          onError: (message) {
            emit(FetchHeritageSitesError(message: message));
            log('Error fetching heritage sites: $message');
          },
        );
  }
}
