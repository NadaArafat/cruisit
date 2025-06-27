part of 'fetch_heritage_sites_cubit.dart';

@immutable
sealed class FetchHeritageSitesState {}

final class FetchHeritageSitesInitial extends FetchHeritageSitesState {}

final class FetchHeritageSitesLoading extends FetchHeritageSitesState
    implements BaseLoadingState {}

final class FetchHeritageSitesSuccess extends FetchHeritageSitesState {
  final List<FamousSiteModel> famousSites;

  FetchHeritageSitesSuccess({required this.famousSites});
}

final class FetchHeritageSitesError extends FetchHeritageSitesState {
  final String message;

  FetchHeritageSitesError({required this.message});
}
