import 'package:pinput/pinput.dart';

import '../../../common_libs.dart';

class OtpCodeInput extends StatefulWidget {
  const OtpCodeInput({super.key});

  @override
  State<OtpCodeInput> createState() => _OtpCodeInputState();
}

class _OtpCodeInputState extends State<OtpCodeInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller.text.isEmpty) {
      _controller.value = TextEditingValue();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.customColors;
    final defaultPinTheme = PinTheme(
      width: 68,
      height: 70,
      textStyle: context.textTheme.headlineMedium?.copyWith(
        color: context.colorScheme.onSurface,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceRaised,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.border, width: 1.2),
      ),
    );

    final activePinTheme = defaultPinTheme.copyDecorationWith(
      color: colors.surfaceRaised,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: colors.focusRing, width: 1.2),
    );

    return SizedBox(
      width: double.infinity,
      child: Pinput(
        controller: _controller,
        length: 4,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: activePinTheme,
        followingPinTheme: activePinTheme,
        submittedPinTheme: defaultPinTheme,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        pinAnimationType: PinAnimationType.none,
        cursor: SizedBox(
          width: 1.5,
          height: 32,
          child: ColoredBox(color: context.colorScheme.onSurface),
        ),
      ),
    );
  }
}
