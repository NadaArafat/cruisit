import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cruisit/features/explore/data/models/cuisine_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:meta/meta.dart';

part 'fetch_cuisines_state.dart';

class FetchCuisinesCubit extends Cubit<FetchCuisinesState> {
  FetchCuisinesCubit() : super(FetchCuisinesInitial());

  Future<void> fetchCuisines() async {
    try {
      await firestore
          .collection('cuisines')
          .get()
          .then(
            (snapshot) {
              if (snapshot.docs.isNotEmpty) {
                List<CuisineModel> cuisines =
                    snapshot.docs
                        .map((doc) => CuisineModel.fromFirestore(doc))
                        .toList();
                emit(FetchCuisinesSuccess(cuisines: cuisines));
                log('Cuisines found: ${cuisines.length}');
              } else {
                emit(FetchCuisinesError(message: 'No cuisines found'));
                log('No cuisines found');
              }
            },
            onError: (message) {
              emit(FetchCuisinesError(message: message));
              log('Error fetching cuisines: $message');
            },
          );
    } on Exception catch (e) {
      log('Error fetching cuisines: $e');
    }
  }

}
