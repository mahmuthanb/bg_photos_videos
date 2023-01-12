import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit() : super(PhotosInitial());
}
