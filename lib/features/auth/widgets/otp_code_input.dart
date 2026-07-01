import '../../../common_libs.dart';

class OtpCodeInput extends StatelessWidget {
  const OtpCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _OtpBox(value: '4'),
        _OtpBox(value: ''),
        _OtpBox(value: ''),
        _OtpBox(value: ''),
      ],
    );
  }
}

class _OtpBox extends StatelessWidget {
  const _OtpBox({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    final focused = value.isEmpty;

    return Container(
      width: 68,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: focused ? const Color(0xFFCCD8EE) : const Color(0xFFE2DDD8),
          width: 1.2,
        ),
      ),
      child: value.isEmpty
          ? const SizedBox(
              width: 1.5,
              height: 32,
              child: ColoredBox(color: Color(0xFF111111)),
            )
          : Text(
              value,
              style: const TextStyle(
                fontSize: 30,
                color: Color(0xFF111111),
                fontWeight: FontWeight.w700,
                letterSpacing: 0,
              ),
            ),
    );
  }
}
