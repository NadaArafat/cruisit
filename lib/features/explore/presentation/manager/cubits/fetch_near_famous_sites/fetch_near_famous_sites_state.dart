part of 'fetch_near_famous_sites_cubit.dart';

@immutable
sealed class FetchNearFamousSitesState {}

final class FetchNearFamousSitesInitial extends FetchNearFamousSitesState {}

final class FetchNearFamousSitesLoading extends FetchNearFamousSitesState
    implements BaseLoadingState {}

final class FetchNearFamousSitesSuccess extends FetchNearFamousSitesState {
  final List<FamousSiteModel> famousSites;
  FetchNearFamousSitesSuccess({required this.famousSites});
}

final class FetchNearFamousSitesError extends FetchNearFamousSitesState {
  final String message;
  FetchNearFamousSitesError({required this.message});
}
