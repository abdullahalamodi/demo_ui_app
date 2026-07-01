import '../../../common_libs.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      FixedAssets.logoWhite,
      width: 128,
      fit: BoxFit.cover,
    );
  }
}
