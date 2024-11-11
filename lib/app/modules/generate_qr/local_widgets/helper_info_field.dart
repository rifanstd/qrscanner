import 'package:flutter/material.dart';

class HelperInfoField extends StatelessWidget {
  const HelperInfoField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "You can put anythting like normal text, link, number, email, etc.",
      style: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
