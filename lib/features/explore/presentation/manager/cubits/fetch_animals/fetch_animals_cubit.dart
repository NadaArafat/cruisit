import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cruisit/features/explore/data/models/animal_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:meta/meta.dart';

part 'fetch_animals_state.dart';

class FetchAnimalsCubit extends Cubit<FetchAnimalsState> {
  FetchAnimalsCubit() : super(FetchAnimalsInitial());

  fetchAnimals() async {
    emit(FetchAnimalsLoading());
    try {
      await firestore
          .collection('animals')
          .get()
          .then(
            (snapshot) {
              if (snapshot.docs.isNotEmpty) {
                List<AnimalModel> animals =
                    snapshot.docs
                        .map((doc) => AnimalModel.fromJson(doc.data()))
                        .toList();
                emit(FetchAnimalsSuccess(animals: animals));
                log('Animals found: ${animals.length}');
              } else {
                emit(FetchAnimalsError(message: 'No animals found'));
                log('No animals found');
              }
            },
            onError: (error) {
              emit(FetchAnimalsError(message: error.toString()));
              log('Error fetching animals: $error');
            },
          );
    } catch (e) {
      emit(FetchAnimalsError(message: e.toString()));
      log('Error fetching animals: $e');
    }
  }
}
