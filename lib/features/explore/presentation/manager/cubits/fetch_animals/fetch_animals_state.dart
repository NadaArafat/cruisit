part of 'fetch_animals_cubit.dart';

@immutable
sealed class FetchAnimalsState {}

final class FetchAnimalsInitial extends FetchAnimalsState {}

final class FetchAnimalsLoading extends FetchAnimalsState
    implements BaseLoadingState {}

final class FetchAnimalsSuccess extends FetchAnimalsState {
  final List<AnimalModel> animals;

  FetchAnimalsSuccess({required this.animals});
}

final class FetchAnimalsError extends FetchAnimalsState {
  final String message;

  FetchAnimalsError({required this.message});
}
