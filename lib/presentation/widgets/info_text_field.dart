import 'package:flutter/material.dart';

class InfoTextField extends StatelessWidget {
  final String header;
  final TextEditingController controller;
  final String? hintText;
  final Function(String)? onChanged;
  final int maxLines;
  final bool enabled;
  const InfoTextField(
      {super.key,
      required this.header,
      required this.controller,
      this.hintText,
      this.onChanged,
      this.maxLines = 1,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12.0),
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
          maxLines: maxLines,
          minLines: 1,
          enabled: enabled,
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
