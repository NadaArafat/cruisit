part of 'fetch_most_visited_countries_cubit.dart';

@immutable
sealed class FetchMostVisitedCountriesState {}

final class FetchMostVisitedCountriesInitial
    extends FetchMostVisitedCountriesState {}

final class FetchMostVisitedCountriesLoading
    extends FetchMostVisitedCountriesState
    implements BaseLoadingState {}

final class FetchMostVisitedCountriesSuccess
    extends FetchMostVisitedCountriesState {
  final List<CountryModel> countries;

  FetchMostVisitedCountriesSuccess({required this.countries});
}

final class FetchMostVisitedCountriesError
    extends FetchMostVisitedCountriesState {
  final String message;

  FetchMostVisitedCountriesError({required this.message});
}
