import '../../../common_libs.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    required this.user,
    required this.onFilterPressed,
    required this.onNotificationsPressed,
    super.key,
  });

  final HomeUser user;
  final VoidCallback onFilterPressed;
  final VoidCallback onNotificationsPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTight = constraints.maxWidth < 340;
        final avatarGap = isTight ? 12.0 : 20.0;
        final actionGap = isTight ? 8.0 : 16.0;
        final textActionGap = isTight ? 8.0 : 12.0;
        final actionSize = isTight ? 48.0 : 52.0;

        return Row(
          children: [
            ClipOval(
              child: Image.asset(
                user.avatarAsset,
                width: 53,
                height: 53,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: avatarGap),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.loc.homeGreeting(user.firstName),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.loc.homeWelcomeBack,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF6A6A6A),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: textActionGap),
            _HeaderActionButton(
              iconAsset: FixedAssets.filterLines,
              size: actionSize,
              tooltip: context.loc.homeSettingsAction,
              onPressed: onFilterPressed,
            ),
            SizedBox(width: actionGap),
            _HeaderActionButton(
              iconAsset: FixedAssets.bell,
              size: actionSize,
              tooltip: context.loc.homeNotificationsAction,
              onPressed: onNotificationsPressed,
            ),
          ],
        );
      },
    );
  }
}

class _HeaderActionButton extends StatelessWidget {
  const _HeaderActionButton({
    required this.iconAsset,
    required this.size,
    required this.tooltip,
    required this.onPressed,
  });

  final String iconAsset;
  final double size;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: context.colorScheme.surface,
        shape: CircleBorder(
          side: BorderSide(color: context.colorScheme.outlineVariant),
        ),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
              child: AppSvgIcon(
                iconAsset,
                size: 19,
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
