import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_google_books/features/books/domain/models/volume_list_item.dart';
import 'package:flutter_google_books/features/books/domain/use_cases/get_volumes_list_use_case.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

part 'volumes_list_state.dart';

@injectable
class VolumesListCubit extends Cubit<VolumesListState> {
  VolumesListCubit(this._getVolumesListUseCase) : super(const NoSearchText());

  final GetVolumesListUseCase _getVolumesListUseCase;

  Future<void> searchVolumes(String searchText) async {
    if (searchText.isEmpty) {
      emit(const NoSearchText());
      return;
    }
    final pagingController = PagingController<int, VolumeListItem>(
      getNextPageKey: (state) =>
          state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: _fetchPage,
    );
    emit(
      HasSearchText(
        searchText: searchText,
        pagingController: pagingController,
      ),
    );
  }

  Future<List<VolumeListItem>> _fetchPage(int pageKey) async {
    if (state case final HasSearchText currentState) {
      final result = await _getVolumesListUseCase(
        currentState.searchText,
        state.pageItems,
        pageKey,
      );
      final items = result.getOrElse((_) {
        throw Exception('Error fetching data');
      });
      return items;
    }
    return [];
  }
}
