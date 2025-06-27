part of 'fetch_experiences_cubit.dart';

@immutable
sealed class FetchExperiencesState {}

final class FetchExperiencesInitial extends FetchExperiencesState {}

final class FetchExperiencesLoading extends FetchExperiencesState
    implements BaseLoadingState {}

final class FetchExperiencesSuccess extends FetchExperiencesState {
  final List<ExperienceModel> experiences;

  FetchExperiencesSuccess({required this.experiences});
}

final class FetchExperiencesError extends FetchExperiencesState {
  final String message;

  FetchExperiencesError({required this.message});
}
