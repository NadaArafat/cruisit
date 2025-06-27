part of 'fetch_continents_cubit.dart';

@immutable
sealed class FetchContinentsState {}

final class FetchContinentsInitial extends FetchContinentsState {}

final class FetchContinentsLoading extends FetchContinentsState
    implements BaseLoadingState {}

final class FetchContinentsSuccess extends FetchContinentsState {
  final List<ContinentModel> continents;

  FetchContinentsSuccess({required this.continents});
}

final class FetchContinentsError extends FetchContinentsState {
  final String message;

  FetchContinentsError({required this.message});
}
