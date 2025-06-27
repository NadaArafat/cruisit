part of 'fetch_unfrequented_countries_cubit.dart';

@immutable
sealed class FetchUnfrequentedCountriesState {}

final class FetchUnfrequentedCountriesInitial
    extends FetchUnfrequentedCountriesState {}

final class FetchUnfrequentedCountriesLoading
    extends FetchUnfrequentedCountriesState
    implements BaseLoadingState {}

final class FetchUnfrequentedCountriesSuccess
    extends FetchUnfrequentedCountriesState {
  final List<CountryModel> countries;

  FetchUnfrequentedCountriesSuccess({required this.countries});
}

final class FetchUnfrequentedCountriesError
    extends FetchUnfrequentedCountriesState {
  final String message;

  FetchUnfrequentedCountriesError({required this.message});
}
