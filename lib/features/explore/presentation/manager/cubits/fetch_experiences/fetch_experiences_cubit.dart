import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cruisit/features/explore/data/models/experience_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:meta/meta.dart';

part 'fetch_experiences_state.dart';

class FetchExperiencesCubit extends Cubit<FetchExperiencesState> {
  FetchExperiencesCubit() : super(FetchExperiencesInitial());

  fetchExperiences() async {
    emit(FetchExperiencesLoading());
    try {
      await firestore
          .collection('experiences')
          .get()
          .then(
            (snapshot) {
              if (snapshot.docs.isNotEmpty) {
                List<ExperienceModel> experiences =
                    snapshot.docs
                        .map((doc) => ExperienceModel.fromJson(doc.data()))
                        .toList();
                emit(FetchExperiencesSuccess(experiences: experiences));
                log('Experiences found: ${experiences.length}');
              } else {
                emit(FetchExperiencesError(message: 'No experiences found'));
                log('No experiences found');
              }
            },
            onError: (error) {
              emit(FetchExperiencesError(message: error.toString()));
              log('Error fetching experiences: $error');
            },
          );
    } catch (e) {
      emit(FetchExperiencesError(message: e.toString()));
      log('Error fetching experiences: $e');
    }
  }
}
