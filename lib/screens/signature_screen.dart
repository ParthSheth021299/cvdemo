import 'dart:io';
import 'dart:ui' as ui;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signature/signature.dart';

/// Created by Parth Sheth.
/// Created on 19/04/23 at 4:00 pm

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({Key? key}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final GlobalKey<SignatureState> _signatureKey = GlobalKey<SignatureState>();

  final SignatureController controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  final storage = FirebaseStorage.instance;


  Future<void> saveFile(File image) async {
    if (await Permission.storage.request().isGranted) {
      final signatureData = await controller.toImage();

      // Encode ui.Image to PNG
      final bytes = await signatureData?.toByteData(format: ui.ImageByteFormat.png);
      final buffer = bytes?.buffer;

      await image.writeAsBytes(buffer!.asUint8List());
      final result = await ImageGallerySaver.saveImage(buffer.asUint8List());

      if (result['isSuccess']) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signature saved to gallery')));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save signature')));
      }

      setState(() {
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Storage permission not granted')));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signature'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            height: 200,
            child: Signature(
              key: _signatureKey,
                controller: controller
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    // final directory = await getExternalStorageDirectory();
                    // final signatureFile = File('/signature.png');
                    final signatureRef = storage.ref().child('signatures/signature.png');
                    final signature = await controller.toImage();
                    final bytes = await signature?.toByteData(format: ui.ImageByteFormat.png);
                    final file = bytes!.buffer.asUint8List();
                    await signatureRef.putData(file).whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('File uploaded successfully'))));
                    
                    // await submitImage(File('/signature.png'));
                  },
                  icon: const Icon(Icons.upload),
                  label: const Text('Upload')),
              ElevatedButton.icon(
                  onPressed: () async {
                    final directory = await getExternalStorageDirectory();
                    final signatureFile = File('${directory!.path}/signature.png');
                    saveFile(signatureFile);
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Save to gallery')),
              ElevatedButton.icon(
                  style: const ButtonStyle(
                      iconColor: MaterialStatePropertyAll(Colors.red),
                      textStyle: MaterialStatePropertyAll(
                          TextStyle(decorationColor: Colors.red))),
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
