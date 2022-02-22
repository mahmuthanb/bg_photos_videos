part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ImageModel> images;
  HomeLoaded({required this.images});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeLoaded && listEquals(other.images, images);
  }

  @override
  int get hashCode => images.hashCode;
}

class HomeFailed extends HomeState {
  final String? message;
  HomeFailed({this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeFailed && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
