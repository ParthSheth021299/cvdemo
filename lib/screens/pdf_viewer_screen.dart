import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MyPdfForm extends StatefulWidget {
  const MyPdfForm({Key? key}) : super(key: key);

  @override
  _MyPdfFormState createState() => _MyPdfFormState();
}

class _MyPdfFormState extends State<MyPdfForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Form'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _generatePdf();
                    }
                  },
                  child: const Text('Generate PDF'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _generatePdf() async {
    final pdf = pw.Document();
    final bytes = await rootBundle.load('assets/images/png/applogo.png');
    final image = pw.MemoryImage(bytes.buffer.asUint8List());

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Image(image),
              pw.Text('Name: ${_nameController.text}'),
              pw.SizedBox(height: 10),
              pw.Text('Email: ${_emailController.text}'),
              pw.SizedBox(height: 10),
            ],
          ),
        );
      },
    ));
    print('PDF: ${pdf.document.fonts}');
    final output = await getExternalStorageDirectory();
    print('Path: ${output?.path}');
    final file = File("${output?.path}/${_nameController.text}.pdf");
    await file.writeAsBytes(await pdf.save());

    // ... continue with saving the PDF to a file or other output
  }
}
