import '../../../common_libs.dart';

class AuthBackgroundScaffold extends StatelessWidget {
  const AuthBackgroundScaffold({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = context.customColors;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(FixedAssets.background, fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colors.mediaScrimLow,
                  colors.mediaScrimMedium,
                  colors.mediaScrimHigh,
                ],
                stops: const [0, .43, 1],
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
