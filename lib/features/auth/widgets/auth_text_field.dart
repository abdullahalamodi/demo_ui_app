import '../../../common_libs.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    required this.label,
    required this.initialValue,
    this.obscure = false,
    super.key,
  });

  final String label;
  final String initialValue;
  final bool obscure;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool _obscure = widget.obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.customColors.onSurfaceSubtle,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 51,
          child: TextFormField(
            initialValue: widget.initialValue,
            obscureText: _obscure,
            style: context.textTheme.labelLarge?.copyWith(),
            obscuringCharacter: '*',
            decoration: InputDecoration(
              suffixIcon: widget.obscure
                  ? IconButton(
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: FaIcon(
                        _obscure
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        size: 17,
                        color: context.colorScheme.onSurface,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
