import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isObsecure;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObsecure = false,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      controller: controller,
      obscureText: isObsecure,
    );
  }
}
