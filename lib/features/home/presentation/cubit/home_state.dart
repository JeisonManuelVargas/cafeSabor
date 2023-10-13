part of 'home_cubit.dart';

class HomeState {
  final int skip;

  const HomeState({required this.skip});

  factory HomeState.init() => const HomeState(skip: 0);

  HomeState copyWith({int? skip}) => HomeState(skip: skip ?? this.skip);
}
