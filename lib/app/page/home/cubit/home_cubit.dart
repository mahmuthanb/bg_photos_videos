import 'dart:convert';
import 'package:bg_photos_videos/core/data/model/image_model.dart';
import 'package:bg_photos_videos/core/data/repository/image_repository.dart';
import 'package:bg_photos_videos/core/data/service/network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final NetworkService networkService;
  HomeCubit({required this.networkService}) : super(HomeLoading()) {
    getAllImages().then((value) => {emit(HomeLoaded(images: value))});
  }

  Future<List<List<ImageModel>>> getAllImages() async {
    List<List<ImageModel>> result = [];
    await ImageRepository(networkService: networkService)
        .searchImage("Nature", orientation: "landscape")
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
                        .searchImage("Germany")
                        .then((value) => result.add(value))
                        .onError((error, stackTrace) {
                      var errorOn = jsonEncode(error);
                      emit(HomeFailed(message: errorOn));
                    }).whenComplete(() =>
                            ImageRepository(networkService: networkService)
                                .searchImage("Netherlands")
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
