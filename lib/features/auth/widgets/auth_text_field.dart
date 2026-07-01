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
          style: const TextStyle(
            color: Color(0xFF9A9A9A),
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: widget.initialValue,
          obscureText: _obscure,
          obscuringCharacter: '*',
          cursorColor: const Color(0xFF111111),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 17,
            ),
            suffixIcon: widget.obscure
                ? IconButton(
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: FaIcon(
                      _obscure
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      size: 17,
                      color: const Color(0xFF242424),
                    ),
                  )
                : null,
            border: _border(const Color(0xFFD8D2CC)),
            enabledBorder: _border(const Color(0xFFD8D2CC)),
            focusedBorder: _border(const Color(0xFFCAD6EF)),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}
