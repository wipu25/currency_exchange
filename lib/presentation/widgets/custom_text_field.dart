import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? value;
  final Function()? onTap;
  final Function(String)? onChanged;
  const CustomTextField({Key? key, this.onChanged, this.value, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(text: value);
    textController.selection =
        TextSelection.fromPosition(TextPosition(offset: value?.length ?? 0));
    return TextField(
      controller: value != null ? textController : null,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: onTap != null ? true : false,
    );
  }
}
