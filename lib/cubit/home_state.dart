part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ImageModel> images;
  HomeLoaded({required this.images});
}

class HomeFailed extends HomeState {}
