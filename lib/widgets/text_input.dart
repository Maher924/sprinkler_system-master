import 'package:flutter/material.dart';

import '../utils/colors_palette.dart';

class TextInput extends StatefulWidget {
  final String hint;
  final TextInputType inputType;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const TextInput({
    Key? key,
    required this.hint,
    this.inputType = TextInputType.text,
    this.prefixIcon,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _obscured = true;
  void _toggleObscure() => setState(() => _obscured = !_obscured);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.inputType == TextInputType.visiblePassword && _obscured,
      keyboardType: widget.inputType,
      validator: widget.validator,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        isDense: true,
        border: const OutlineInputBorder(borderSide: BorderSide(color: ColorsPalette.darkGrey)),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, color: ColorsPalette.grey) : null,
        hintText: widget.hint,
        hintStyle: const TextStyle(color: ColorsPalette.grey),
        suffixIcon: widget.inputType == TextInputType.visiblePassword
            ? IconButton(
                icon: Icon(_obscured ? Icons.visibility : Icons.visibility_off),
                onPressed: _toggleObscure,
              )
            : null,
      ),
    );
  }
}
