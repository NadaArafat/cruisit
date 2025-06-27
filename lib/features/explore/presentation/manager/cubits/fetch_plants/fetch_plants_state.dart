part of 'fetch_plants_cubit.dart';

@immutable
sealed class FetchPlantsState {}

final class FetchPlantsInitial extends FetchPlantsState {}

final class FetchPlantsLoading extends FetchPlantsState
    implements BaseLoadingState {}

final class FetchPlantsSuccess extends FetchPlantsState {
  final List<PlantModel> plants;

  FetchPlantsSuccess({required this.plants});
}

final class FetchPlantsError extends FetchPlantsState {
  final String message;

  FetchPlantsError({required this.message});
}
