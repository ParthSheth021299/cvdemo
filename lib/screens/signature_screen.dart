import 'dart:io';
import 'dart:ui' as ui;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signature/signature.dart';

/**
 * Created by Parth Sheth.
 * Created on 19/04/23 at 4:00 pm
 */

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({Key? key}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final SignatureController controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  Uint8List? _signatureData;



  Future<void> submitImage(File image) async {
    if (await Permission.storage.request().isGranted) {
      final signatureData = await controller.toImage();

      // Encode ui.Image to PNG
      final bytes =
          await signatureData?.toByteData(format: ui.ImageByteFormat.png);
      final buffer = bytes?.buffer;

      await image.writeAsBytes(buffer!.asUint8List());

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('signatures/mysignature.png');
      TaskSnapshot taskSnapshot = await ref.putFile(image);

      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // Save image to gallery
      final result = await ImageGallerySaver.saveImage(buffer.asUint8List());

      if (result['isSuccess']) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signature saved to gallery')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to save signature')));
      }

      setState(() {
        _signatureData = buffer.asUint8List();
      });
    } else {
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
          Container(
            width: 250,
            height: 200,
            child: Signature(controller: controller),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      onPressed: () async {
                        final directory = await getExternalStorageDirectory();
                        final signatureFile =
                            File('${directory!.path}/signature.png');
                        await submitImage(signatureFile);
                      },
                      icon: Icon(Icons.upload),
                      label: const Text('Upload')),
                  ElevatedButton.icon(
                      onPressed: () {
                        controller.clear();
                      },
                      icon: Icon(Icons.save),
                      label: const Text('Save to gallery')),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: Icon(Icons.delete,color: Colors.red),
                    label: const Text('Remove',style: TextStyle(color: Colors.red),)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
