import '../../../common_libs.dart';

class OtpCodeInput extends StatelessWidget {
  const OtpCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _OtpBox(value: context.loc.otpFirstDigit),
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
    final colors = context.customColors;

    return Container(
      width: 68,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.surfaceRaised,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: focused ? colors.focusRing : colors.borderMuted,
          width: 1.2,
        ),
      ),
      child: value.isEmpty
          ? SizedBox(
              width: 1.5,
              height: 32,
              child: ColoredBox(color: context.colorScheme.onSurface),
            )
          : Text(
              value,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
    );
  }
}
