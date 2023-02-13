import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final int maxLines;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hintText,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white54,
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              hintStyle: const TextStyle(color: Colors.blueGrey)),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
