part of 'locality_cubit.dart';

sealed class LocalityState extends Equatable {
  const LocalityState();

  @override
  List<Object> get props => [];
}

final class LocalityInitial extends LocalityState {}

final class LocalityLoading extends LocalityState {}

final class LocalityError extends LocalityState {
  final String message;
  const LocalityError(this.message);
}

final class LocalityLoaded extends LocalityState {
  final List<Locality> localities;
  const LocalityLoaded(this.localities);
}

final class LocalityRegionsLoaded extends LocalityState {
  final List<String> regions;
  const LocalityRegionsLoaded(this.regions);
}
