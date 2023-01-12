import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_detail_state.dart';

class ImageDetailCubit extends Cubit<ImageDetailState> {
  ImageDetailCubit() : super(ImageDetailInitial());
}
