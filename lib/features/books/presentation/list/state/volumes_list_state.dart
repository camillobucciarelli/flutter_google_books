part of 'volumes_list_cubit.dart';

abstract class VolumesListState extends Equatable {
  const VolumesListState({this.searchText = ''});

  final int pageItems = 10;
  final String searchText;

  @override
  List<Object?> get props => [pageItems, searchText];
}

final class NoSearchText extends VolumesListState {
  const NoSearchText() : super(searchText: '');
}

final class HasSearchText extends VolumesListState {
  const HasSearchText({super.searchText, required this.pagingController}) : super();

  final PagingController<int, VolumeListItem> pagingController;
}