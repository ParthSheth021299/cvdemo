import 'package:flutter/material.dart';

import '../widgets/simple_pdf_viewer_widget.dart';

/**
 * Created by Parth Sheth.
 * Created on 25/04/23 at 11:17 am
 */
class PdfViewerScreen extends StatelessWidget {
  const PdfViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SimpleCvViewer()));
          }, child: Text('Simple CV ')),
          ElevatedButton(onPressed: (){}, child: Text('Modern CV '))
        ],
      ),
    );
  }
}
