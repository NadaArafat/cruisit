part of 'fetch_guides_cubit.dart';

@immutable
sealed class FetchGuidesState {}

final class FetchGuidesInitial extends FetchGuidesState {}

final class FetchGuidesLoading extends FetchGuidesState
    implements BaseLoadingState {}

final class FetchGuidesSuccess extends FetchGuidesState {
  final List<GuideModel> guides;

  FetchGuidesSuccess({required this.guides});
}

final class FetchGuidesError extends FetchGuidesState {
  final String message;

  FetchGuidesError({required this.message});
}
