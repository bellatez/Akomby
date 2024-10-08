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
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
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
              hintStyle: TextStyle(
                color: Colors.grey
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[200],  // Light grey background
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}



class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget({
    super.key,
    required this.labelText,
    required this.items,
    required this.onChanged,
    this.selectedValue,
  });

  final String labelText;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey[200],  // Customizing background
        ),
        value: selectedValue,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
