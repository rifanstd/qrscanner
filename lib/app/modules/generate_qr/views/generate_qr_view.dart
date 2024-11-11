import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../global_widgets/custom_button.dart';
import '../controllers/generate_qr_controller.dart';
import '../local_widgets/download_button.dart';
import '../local_widgets/helper_info_field.dart';
import '../local_widgets/qr_text_input_field.dart';

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
                  const HelperInfoField(),
                  const SizedBox(height: 16),
                  QRTextInputField(textEditingController: controller.qrTextController),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: Get.width,
                    child: FilledPrimaryButton(
                      onPressed: controller.generateQr,
                      title: "Generate",
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
                              DownloadButton(
                                onClicked: () => controller.saveQr(context),
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
