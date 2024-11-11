import 'package:flutter/material.dart';

class QRTextInputField extends StatelessWidget {
  final TextEditingController textEditingController;

  const QRTextInputField({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.amber,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      maxLines: null,
      minLines: 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter your text",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amberAccent), // Warna border bawah saat tidak fokus
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber, width: 2), // Warna border bawah saat fokus
        ),
      ),
    );
  }
}
