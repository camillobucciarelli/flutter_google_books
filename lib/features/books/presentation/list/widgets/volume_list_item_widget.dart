part of '../volumes_list_page.dart';

class _VolumeListItemWidget extends StatelessWidget {
  const _VolumeListItemWidget(this.item);

  final VolumeListItem item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VolumeListItemCubit>(
      create: (context) => GetIt.I()..init(item.id),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.pushNamed(
            context,
            VolumeDetailPage.routeName,
            arguments: item.id,
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    height: 110,
                    width: 80,
                    fit: BoxFit.cover,
                    imageUrl: item.imageUrl ?? '',
                    placeholder: (context, url) => const SizedBox(
                      height: 110,
                      width: 80,
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 110,
                      width: 80,
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerHighest,
                      child: const Icon(Icons.image_not_supported_outlined),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        item.authors.join(', '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<VolumeListItemCubit, VolumeListItemState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () => context
                          .read<VolumeListItemCubit>()
                          .toggleFavorite(item.id),
                      icon: Icon(
                        state.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
