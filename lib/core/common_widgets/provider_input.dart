import 'package:flutter/material.dart';


class ProviderInputWidget extends StatelessWidget {
  const ProviderInputWidget({super.key, required this.controller, required this.labelText, required this.hintText, required this.textInputType, required this.maxline});

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType textInputType;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$labelText:",
          style: TextStyle(
            fontSize: 15
          ),
        ),
        TextFormField(
          maxLines: maxline,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.grey[200],  // Light grey background
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
