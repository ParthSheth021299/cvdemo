import 'package:flutter/material.dart';
import '../widgets/Add_more_section_widget.dart';

class AddMoreScreen extends StatelessWidget {
  const AddMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add More Section'),
      ),
      body: const AddMoreSectionWidget(),
    );
  }
}
