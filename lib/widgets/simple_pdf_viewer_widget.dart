import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../provider/personal_detail_provider.dart';

/**
 * Created by Parth Sheth.
 * Created on 25/04/23 at 11:21 am
 */

class SimpleCvViewer extends StatefulWidget {
  const SimpleCvViewer({Key? key}) : super(key: key);
  static const routeName = '/simplecvview';

  @override
  State<SimpleCvViewer> createState() => _SimpleCvViewerState();
}

class _SimpleCvViewerState extends State<SimpleCvViewer> {
  final pdf = pw.Document();

  void _createPdf() async {
    final bytes = await rootBundle.load('assets/images/png/applogo.png');
    final imageProvider = pw.MemoryImage(bytes.buffer.asUint8List());
    final image = pw.Image(imageProvider, height: 50, width: 50);

    pdf.addPage(pw.Page(
      margin: const pw.EdgeInsets.all(20),
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                image,
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                 children: [
                   pw.Text('John Doe', style: const pw.TextStyle(fontSize: 25)),
                   pw.SizedBox(height: 10),
                   pw.Text('Software Engineer', style: const pw.TextStyle(fontSize: 18)),
                 ]
                )
              ]
            ),
            pw.Divider(thickness: 1, color: PdfColors.grey300),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Email', style: const pw.TextStyle(fontSize: 16)),
                    pw.SizedBox(height: 5),
                    pw.Text('john.doe@example.com'),
                    pw.SizedBox(height: 10),
                    pw.Text('Phone', style: const pw.TextStyle(fontSize: 16)),
                    pw.SizedBox(height: 5),
                    pw.Text('+1 555-555-5555'),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Location',
                        style: const pw.TextStyle(fontSize: 16)),
                    pw.SizedBox(height: 5),
                    pw.Text('New York, NY'),
                    pw.SizedBox(height: 10),
                    pw.Text('LinkedIn',
                        style: const pw.TextStyle(fontSize: 16)),
                    pw.SizedBox(height: 5),
                    pw.Text('linkedin.com/in/johndoe'),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Text('Summary', style: const pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text(
              'A software engineer with 5 years of experience building web and mobile applications. Skilled in Ruby on Rails, React, and Flutter. Passionate about writing clean, maintainable, and testable code.',
              style: const pw.TextStyle(fontSize: 16),
            ),
            pw.SizedBox(height: 20),
            pw.Text('Skills', style: const pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Bullet(
              text: 'Ruby on Rails',
              // style: pw.BulletStyle(textStyle: pw.TextStyle(fontSize: 16)),
            ),
            pw.Bullet(
              text: 'React',
              // style: pw.BulletStyle(textStyle: pw.TextStyle(fontSize: 16)),
            ),
            pw.Bullet(
              text: 'Flutter',
              // style: pw.BulletStyle(textStyle: pw.TextStyle(fontSize: 16)),
            ),
            pw.SizedBox(height: 20),
            pw.Text('Experience', style: const pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 10),
            pw.Text('Software Engineer',
                style: const pw.TextStyle(fontSize: 18)),
            pw.Text('ABC Company', style: const pw.TextStyle(fontSize: 16)),
            pw.Text('New York, NY', style: const pw.TextStyle(fontSize: 16)),
            pw.SizedBox(height: 5),
            pw.Text('Jan 2018 - Present',
                style: const pw.TextStyle(fontSize: 16)),
          ],
        );
      },
    ));

  }

  Future<void> _savePdf() async {
    _createPdf();
    final directory = await getExternalStorageDirectory();
    print('directory:$directory');
    final String filePath = '${directory?.path}/cv.pdf';

    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await _savePdf();
                },
                child: const Text('View'))
          ],
        ),
      ),
    );
  }
}
