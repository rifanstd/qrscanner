import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QRCodeDataSection extends StatelessWidget {
  final String data;
  final void Function() onCopyIconClicked;

  const QRCodeDataSection({
    super.key,
    required this.data,
    required this.onCopyIconClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(data),
          const SizedBox(width: 16),
          InkWell(
            onTap: () {
              onCopyIconClicked();
              Get.snackbar("Copied!", "Text copied to clipboard.", snackPosition: SnackPosition.BOTTOM, margin: const EdgeInsets.all(16));
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.copy_rounded,
                    color: Colors.amber,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text("Copy", style: TextStyle(color: Colors.amber)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
