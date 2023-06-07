// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_detail_state.dart';

class ImageDetailCubit extends Cubit<ImageDetailState> {
  ImageDetailCubit() : super(ImageDetailInitial());
}
