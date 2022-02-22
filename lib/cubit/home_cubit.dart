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
    getAllImages().then((value) => {emit(HomeLoaded(images: value))});
  }
  Future<List<List<ImageModel>>> getAllImages() async {
    List<List<ImageModel>> result = [];
    await ImageRepository(networkService: networkService)
        .searchImage("Turkey", orientation: "landscape")
        .then((value) => result.add(value))
        .onError((error, stackTrace) {
          var errorOn = jsonEncode(error);
          emit(HomeFailed(message: errorOn));
        })
        .whenComplete(() => ImageRepository(networkService: networkService)
                .fetchImage()
                .then((value) => result.add(value))
                .onError((error, stackTrace) {
              var errorOn = jsonEncode(error);
              emit(HomeFailed(message: errorOn));
            }).whenComplete(() =>
                    ImageRepository(networkService: networkService)
                        .searchImage("Turkey")
                        .then((value) => result.add(value))
                        .onError((error, stackTrace) {
                      var errorOn = jsonEncode(error);
                      emit(HomeFailed(message: errorOn));
                    }).whenComplete(() =>
                            ImageRepository(networkService: networkService)
                                .searchImage("Turkey")
                                .then((value) => result.add(value))
                                .onError((error, stackTrace) {
                              var errorOn = jsonEncode(error);
                              emit(HomeFailed(message: errorOn));
                            }))))
        .onError((error, stackTrace) {
          var errorOn = jsonEncode(error);
          emit(HomeFailed(message: errorOn));
        })
        .then((value) {
          return result;
        });
    return result;
  }
}
