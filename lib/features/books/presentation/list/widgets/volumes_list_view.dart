part of '../volumes_list_page.dart';

class _VolumesListView extends StatelessWidget {
  const _VolumesListView(this.pagingController);

  final PagingController<int, VolumeListItem> pagingController;

  @override
  Widget build(BuildContext context) {
    return PagingListener<int, VolumeListItem>(
      controller: pagingController,
      builder: (context, state, fetchNextPage) {
        return PagedListView.separated(
          state: state,
          padding: EdgeInsets.all(8),
          fetchNextPage: fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate<VolumeListItem>(
            itemBuilder: (context, item, index) {
              return _VolumeListItemWidget(item);
            },
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        );
      },
    );
  }
}
