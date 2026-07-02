import '../../../common_libs.dart';

class HomeBottomGradient extends StatelessWidget {
  const HomeBottomGradient({
    this.height = 175,
    super.key,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.colorScheme.surface.withValues(alpha: 0),
              context.colorScheme.surface.withValues(alpha: .94),
              context.colorScheme.surface,
            ],
            stops: const [0, .38, 1],
          ),
        ),
      ),
    );
  }
}
