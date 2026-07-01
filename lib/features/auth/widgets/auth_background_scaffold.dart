import '../../../common_libs.dart';

class AuthBackgroundScaffold extends StatelessWidget {
  const AuthBackgroundScaffold({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
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
                  Colors.black.withValues(alpha: .16),
                  Colors.black.withValues(alpha: .04),
                  Colors.black.withValues(alpha: .34),
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
