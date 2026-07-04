import '../../../common_libs.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    required this.selectedItem,
    required this.onSelected,
    super.key,
  });

  final HomeBottomNavItem selectedItem;
  final ValueChanged<HomeBottomNavItem> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: HomeBottomNavItem.values.map((item) {
          return _BottomNavButton(
            item: item,
            label: _labelFor(context, item),
            isSelected: selectedItem == item,
            onTap: () => onSelected(item),
          );
        }).toList(),
      ),
    );
  }

  String _labelFor(BuildContext context, HomeBottomNavItem item) {
    return switch (item) {
      HomeBottomNavItem.home => context.loc.homeNavHome,
      HomeBottomNavItem.calendar => context.loc.homeNavCalendar,
      HomeBottomNavItem.profile => context.loc.homeNavProfile,
      HomeBottomNavItem.trophy => context.loc.homeNavTrophy,
      HomeBottomNavItem.menu => context.loc.homeNavMenu,
    };
  }
}

class _BottomNavButton extends StatelessWidget {
  const _BottomNavButton({
    required this.item,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final HomeBottomNavItem item;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final selectedIconAsset = item.selectedIconAsset;
    final isUsingSelectedIcon = isSelected && selectedIconAsset != null;
    final iconAsset = isUsingSelectedIcon ? selectedIconAsset : item.iconAsset;
    final foregroundColor = isSelected
        ? context.colorScheme.onPrimary
        : context.colorScheme.onSurface;
    final backgroundColor = isSelected
        ? context.colorScheme.primary
        : context.colorScheme.surface;

    return Tooltip(
      message: label,
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusL),
          side: isSelected
              ? BorderSide.none
              : BorderSide(color: context.colorScheme.outlineVariant),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(kRadiusL),
          child: SizedBox(
            width: 55,
            height: 55,
            child: Center(
              child: AppSvgIcon(
                iconAsset,
                size: 20,
                color: isUsingSelectedIcon || !isSelected
                    ? null
                    : foregroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
