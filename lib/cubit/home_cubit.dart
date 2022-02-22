import 'dart:convert';

import 'package:bg_photos_videos/data/image_repository.dart';
import 'package:bg_photos_videos/data/model/image_model.dart';
import 'package:bg_photos_videos/data/network.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final NetworkService networkService;
  HomeCubit({required this.networkService}) : super(HomeLoading()) {
    List<ImageModel> result = [];
    ImageRepository(networkService: networkService).fetchImage().then((value) {
      result = value;
      return result;
    }).then((value) {
      emit(HomeLoaded(images: result));
    }).onError((error, stackTrace) {
      var errorOn = jsonEncode(error);
      emit(HomeFailed(message: errorOn));
    });
  }
}
