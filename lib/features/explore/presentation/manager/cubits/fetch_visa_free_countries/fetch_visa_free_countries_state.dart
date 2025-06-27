part of 'fetch_visa_free_countries_cubit.dart';

@immutable
sealed class FetchVisaFreeCountriesState {}

final class FetchVisaFreeCountriesInitial extends FetchVisaFreeCountriesState {}

final class FetchVisaFreeCountriesLoading extends FetchVisaFreeCountriesState
    implements BaseLoadingState {}

final class FetchVisaFreeCountriesSuccess extends FetchVisaFreeCountriesState {
  final List<CountryModel> countries;

  FetchVisaFreeCountriesSuccess({required this.countries});
}

final class FetchVisaFreeCountriesError extends FetchVisaFreeCountriesState {
  final String message;

  FetchVisaFreeCountriesError({required this.message});
}
