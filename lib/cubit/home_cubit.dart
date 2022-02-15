import 'package:bg_photos_videos/data/image_repository.dart';
import 'package:bg_photos_videos/data/model/image_model.dart';
import 'package:bg_photos_videos/data/network.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final NetworkService networkService;
  HomeCubit({required this.networkService}) : super(HomeLoading()) {
    Future<List<ImageModel>> resultImg = ImageRepository(networkService: networkService).fetchImage();
    List<ImageModel> result = [];
    resultImg.then((img) {
      result = img;
    });
    emit(HomeLoaded(images: result));
  }
}
