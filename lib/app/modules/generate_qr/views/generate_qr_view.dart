import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../controllers/generate_qr_controller.dart';

class GenerateQrView extends GetView<GenerateQrController> {
  const GenerateQrView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generate QR Code',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight: Get.height, minWidth: Get.width),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Obx(
            () => Form(
              key: controller.qrFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Text Input",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "You can put anythting like normal text, link, number, email, etc.",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.qrTextController,
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
                      hintText: "Enter your text ",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amberAccent), // Warna border bawah saat tidak fokus
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2), // Warna border bawah saat fokus
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: Get.width,
                    child: FilledButton(
                      onPressed: controller.generateQr,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.amber),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Atur border radius sesuai keinginan
                          ),
                        ),
                      ),
                      child: const Text(
                        "Generate",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "Result",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  controller.qrData.value.isEmpty
                      ? Text(
                          "No result yet",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        )
                      : Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                            children: [
                              const Text("QR Code Result", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 16),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  return SizedBox(
                                    width: 200,
                                    child: PrettyQrView(
                                      qrImage: controller.qrImage.value!,
                                      decoration: const PrettyQrDecoration(
                                        shape: PrettyQrSmoothSymbol(roundFactor: 0, color: Colors.amber),
                                        background: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              InkWell(
                                onTap: () => controller.saveQr(context),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.amber),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.download_rounded,
                                        color: Colors.amber,
                                        size: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "Download",
                                        style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
