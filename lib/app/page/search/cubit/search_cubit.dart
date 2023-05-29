import 'package:bg_photos_videos/app/data/repository/image_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final ImageRepository _imageRepository;

  // SearchCubit() : super(SearchInitial());
  SearchCubit(this._imageRepository) : super(SearchInitial());

  doSearch(String query) async {
    emit(SearchLoading());
    final searchResult = await _imageRepository.searchImage(query);
    if (kDebugMode) {
      print("searchresult length is: ${searchResult.photos!.length}");
    }
  }
}
