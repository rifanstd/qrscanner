import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrscanner/app/core/utils/random_uid.dart';

extension QrImageExtension on QrImage {
  Future<String?> exportAsImage(final BuildContext context) async {
    final configuration = createLocalImageConfiguration(context);
    final docDirectory = await getExternalStorageDirectory();

    if (docDirectory == null) return null;

    final bytes = await toImageAsBytes(
      size: 512,
      decoration: const PrettyQrDecoration(
        shape: PrettyQrSmoothSymbol(roundFactor: 0, color: Colors.amber),
      ),
      format: ImageByteFormat.png,
      configuration: configuration,
    );

    final file = await File('${docDirectory.path}/${RandomUID.getRandomStringUID(10)}.png').create();
    await file.writeAsBytes(bytes!.buffer.asUint8List());
    return docDirectory.path;
  }
}
