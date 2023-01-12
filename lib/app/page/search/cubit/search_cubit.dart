import 'package:bg_photos_videos/core/data/repository/image_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ImageRepository imageRepository;

  // SearchCubit() : super(SearchInitial());
  SearchCubit({required this.imageRepository}) : super(SearchInitial());

  doSearch(String query) async {
    emit(SearchLoading());
    final searchResult = await imageRepository.searchImage(query);
    if (kDebugMode) {
      print("searchresult length is: ${searchResult.length}");
    }
  }
}
