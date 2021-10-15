import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool flag;
  const BuildTextField({
    Key key,
    this.hintText,
    this.icon,
    this.controller,
    this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        errorText:
            flag && controller.text.isEmpty ? "$hintText can't be null" : null,
        constraints: BoxConstraints(
          maxHeight: flag ? 70 : 50,
          maxWidth: 380,
        ),
        prefixIcon: Icon(icon),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: "   $hintText",
        border: InputBorder.none,
      ),
    );
  }
}
