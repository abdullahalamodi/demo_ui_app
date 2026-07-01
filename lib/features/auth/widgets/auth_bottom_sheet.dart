import '../../../common_libs.dart';

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({
    required this.child,
    required this.top,
    this.horizontalPadding = 32,
    this.topPadding = 36,
    super.key,
  });

  final Widget child;
  final double top;
  final double horizontalPadding;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    const bodyTop = 24.0;
    const bodyRadius = 50.0;
    const capLeft = 40.0;
    const capHeight = 48.0;
    const capRadius = 48.0;
    final colors = context.customColors;

    return Positioned(
      left: 0,
      right: 0,
      top: top,
      bottom: 0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: capLeft,
            right: 0,
            top: 10,
            height: capHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors.surfaceRaised,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(capRadius),
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: bodyTop,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors.surfaceRaised,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(bodyRadius),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  topPadding,
                  horizontalPadding,
                  24,
                ),
                physics: ClampingScrollPhysics(),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
