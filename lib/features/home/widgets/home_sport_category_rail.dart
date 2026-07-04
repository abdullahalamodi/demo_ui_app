import '../../../common_libs.dart';

class HomeSportCategoryRail extends StatelessWidget {
  const HomeSportCategoryRail({
    required this.categories,
    required this.selectedId,
    required this.onSelected,
    super.key,
  });

  final List<HomeSportCategory> categories;
  final String selectedId;
  final ValueChanged<HomeSportCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 13),
        itemBuilder: (context, index) {
          final category = categories[index];
          return _HomeSportCategoryChip(
            category: category,
            isSelected: selectedId == category.id,
            onTap: () => onSelected(category),
          );
        },
      ),
    );
  }
}

class _HomeSportCategoryChip extends StatelessWidget {
  const _HomeSportCategoryChip({
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final HomeSportCategory category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final label = category.label;
    final isDarkChip = isSelected;
    final foregroundColor = isDarkChip
        ? context.colorScheme.onPrimary
        : context.colorScheme.onSurface;
    final backgroundColor = isDarkChip
        ? context.colorScheme.onSurface
        : context.customColors.surfaceTinted;

    return Tooltip(
      message: label ?? context.loc.homeSavedAction,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(kRadiusPill),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(kRadiusPill),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: category.isIconOnly ? 57 : 110,
              minHeight: 50,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: category.isIconOnly ? 20 : 22,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSvgIcon(
                    category.iconAsset,
                    color: foregroundColor,
                  ),
                  if (label != null) ...[
                    const SizedBox(width: 12),
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: foregroundColor,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
