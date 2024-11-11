import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QRCodeImageSection extends StatelessWidget {
  final Uint8List imageData;

  const QRCodeImageSection({
    super.key,
    required this.imageData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: MemoryImage(imageData)),
        ],
      ),
    );
  }
}
