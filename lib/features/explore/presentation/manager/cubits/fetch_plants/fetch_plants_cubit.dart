import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cruisit/features/explore/data/models/plant_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:meta/meta.dart';

part 'fetch_plants_state.dart';

class FetchPlantsCubit extends Cubit<FetchPlantsState> {
  FetchPlantsCubit() : super(FetchPlantsInitial());
  Future<void> fetchPlants() async {
    emit(FetchPlantsLoading());
    try {
      await firestore
          .collection('plants')
          .get()
          .then(
            (snapshot) {
              if (snapshot.docs.isNotEmpty) {
                List<PlantModel> plants =
                    snapshot.docs
                        .map((doc) => PlantModel.fromJson(doc.data()))
                        .toList();
                emit(FetchPlantsSuccess(plants: plants));
                log('Plants found: ${plants.length}');
              } else {
                emit(FetchPlantsError(message: 'No plants found'));
                log('No plants found');
              }
            },
            onError: (error) {
              emit(FetchPlantsError(message: error.toString()));
              log('Error fetching plants: $error');
            },
          );
    } catch (e) {
      emit(FetchPlantsError(message: e.toString()));
      log('Error fetching plants: $e');
    }
  }
}
