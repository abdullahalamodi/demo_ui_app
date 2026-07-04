import '../../common_libs.dart';

class AppSvgIcon extends StatelessWidget {
  const AppSvgIcon(
    this.asset, {
    this.size,
    this.width,
    this.height,
    this.color,
    super.key,
  });

  final String asset;
  final double? size;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final resolvedWidth = width ?? size;
    final resolvedHeight = height ?? size;

    return SvgPicture.asset(
      asset,
      width: resolvedWidth,
      height: resolvedHeight,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            ),
    );
  }
}
