part of 'fetch_most_popular_cities_cubit.dart';

@immutable
sealed class FetchMostPopularCitiesState {}

final class FetchMostPopularCitiesInitial extends FetchMostPopularCitiesState {}

final class FetchMostPopularCitiesLoading extends FetchMostPopularCitiesState
    implements BaseLoadingState {}

final class FetchMostPopularCitiesSuccess extends FetchMostPopularCitiesState {
  final List<CityModel> cities;

  FetchMostPopularCitiesSuccess({required this.cities});
}

final class FetchMostPopularCitiesError extends FetchMostPopularCitiesState {
  final String message;

  FetchMostPopularCitiesError({required this.message});
}
