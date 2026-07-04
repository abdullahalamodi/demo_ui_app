import '../../../common_libs.dart';

class HomeFilterSortBar extends StatelessWidget {
  const HomeFilterSortBar({
    required this.onFilterPressed,
    required this.onSortPressed,
    super.key,
  });

  final VoidCallback onFilterPressed;
  final VoidCallback onSortPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174,
      height: 42,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(kRadiusPill),
        boxShadow: [
          BoxShadow(
            color: context.customColors.shadowSoft,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _FilterSortButton(
              iconAsset: FixedAssets.filterList,
              label: context.loc.homeFilter,
              onPressed: onFilterPressed,
            ),
          ),
          SizedBox(
            width: 1,
            height: 42,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.outlineVariant,
              ),
            ),
          ),
          Expanded(
            child: _FilterSortButton(
              iconAsset: FixedAssets.sortAscending,
              label: context.loc.homeSort,
              onPressed: onSortPressed,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterSortButton extends StatelessWidget {
  const _FilterSortButton({
    required this.iconAsset,
    required this.label,
    required this.onPressed,
  });

  final String iconAsset;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      borderRadius: BorderRadius.circular(kRadiusPill),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSvgIcon(
              iconAsset,
              size: 15,
              color: context.colorScheme.onSurface,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              maxLines: 1,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
