import 'dart:convert';
import 'package:bg_photos_videos/app/data/model/image_model.dart';
import 'package:bg_photos_videos/app/data/repository/image_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final ImageRepository _imageRepository;
  HomeCubit(this._imageRepository) : super(HomeLoading()) {
    getAllImages().then((value) => {emit(HomeLoaded(images: value))});
  }

  Future<List<List<ImageModel>>> getAllImages() async {
    List<List<ImageModel>> result = [];
    await _imageRepository
        .searchImage("Nature", orientation: "landscape")
        .then((value) => result.add(value.photos!))
        .onError((error, stackTrace) {
          var errorOn = jsonEncode(error);
          emit(HomeFailed(message: errorOn));
        })
        .whenComplete(() => _imageRepository
                .fetchImage()
                .then((value) => result.add(value.photos!))
                .onError((error, stackTrace) {
              var errorOn = jsonEncode(error);
              emit(HomeFailed(message: errorOn));
            }).whenComplete(() => _imageRepository
                        .searchImage("Germany")
                        .then((value) => result.add(value.photos!))
                        .onError((error, stackTrace) {
                      var errorOn = jsonEncode(error);
                      emit(HomeFailed(message: errorOn));
                    }).whenComplete(() => _imageRepository
                                .searchImage("Netherlands")
                                .then((value) => result.add(value.photos!))
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
