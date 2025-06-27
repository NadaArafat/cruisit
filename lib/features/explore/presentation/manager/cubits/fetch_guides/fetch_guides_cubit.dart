import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cruisit/features/explore/data/models/guide_model.dart';
import 'package:cruisit/features/explore/presentation/manager/base_loading_state.dart';
import 'package:cruisit/utils/constants.dart';
import 'package:meta/meta.dart';

part 'fetch_guides_state.dart';

class FetchGuidesCubit extends Cubit<FetchGuidesState> {
  FetchGuidesCubit() : super(FetchGuidesInitial());

  Future<void> fetchGuides() async {
    try {
      await firestore
          .collection('guides')
          .get()
          .then(
            (snapshot) {
              if (snapshot.docs.isNotEmpty) {
                List<GuideModel> guides =
                    snapshot.docs
                        .map((doc) => GuideModel.fromFirestore(doc))
                        .toList();
                emit(FetchGuidesSuccess(guides: guides));
                log('Guides found: ${guides.length}');
              } else {
                emit(FetchGuidesError(message: 'No guides found'));
                log('No guides found');
              }
            },
            onError: (message) {
              emit(FetchGuidesError(message: message));
              log('Error fetching guides: $message');
            },
          );
    } on Exception catch (e) {
      log('Error fetching guides: $e');
    }
  }
}
