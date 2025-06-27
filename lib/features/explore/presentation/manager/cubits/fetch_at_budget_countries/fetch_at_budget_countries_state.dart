part of 'fetch_at_budget_countries_cubit.dart';

@immutable
sealed class FetchAtBudgetCountriesState {}

final class FetchAtBudgetCountriesLoading extends FetchAtBudgetCountriesState
    implements BaseLoadingState {}

final class FetchAtBudgetCountriesSuccess extends FetchAtBudgetCountriesState {
  final List<CountryModel> countries;

  FetchAtBudgetCountriesSuccess({required this.countries});
}

final class FetchAtBudgetCountriesError extends FetchAtBudgetCountriesState {
  final String message;

  FetchAtBudgetCountriesError({required this.message});
}
