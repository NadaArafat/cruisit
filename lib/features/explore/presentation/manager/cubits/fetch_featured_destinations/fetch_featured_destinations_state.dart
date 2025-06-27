part of 'fetch_featured_destinations_cubit.dart';

@immutable
sealed class FetchFeaturedDestinationsState {}

final class FetchFeaturedDestinationsInitial
    extends FetchFeaturedDestinationsState {}

final class FetchFeaturedDestinationsLoading
    extends FetchFeaturedDestinationsState
    implements BaseLoadingState {}

final class FetchFeaturedDestinationsSuccess
    extends FetchFeaturedDestinationsState {
  final List<FeaturedModel> featuredDestinations;
  final List<DestinationModel> destinations;
  FetchFeaturedDestinationsSuccess({
    required this.featuredDestinations,
    required this.destinations,
  });
}

final class FetchFeaturedDestinationsError
    extends FetchFeaturedDestinationsState {
  final String error;
  FetchFeaturedDestinationsError({required this.error});
}
