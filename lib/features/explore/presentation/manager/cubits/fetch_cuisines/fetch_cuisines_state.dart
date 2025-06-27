part of 'fetch_cuisines_cubit.dart';

@immutable
sealed class FetchCuisinesState {}

final class FetchCuisinesInitial extends FetchCuisinesState {}

final class FetchCuisinesLoading extends FetchCuisinesState
    implements BaseLoadingState {}

final class FetchCuisinesSuccess extends FetchCuisinesState {
  final List<CuisineModel> cuisines;
  FetchCuisinesSuccess({required this.cuisines});
}

final class FetchCuisinesError extends FetchCuisinesState {
  final String message;
  FetchCuisinesError({required this.message});
}
