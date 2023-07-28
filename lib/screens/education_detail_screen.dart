import 'package:flutter/material.dart';
import '../widgets/education_detail_from_widget.dart';


class EducationDetailScreen extends StatelessWidget {
  const EducationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Education Detail'),
      ),
      body: const EducationDetailWidget(),
    );
  }
}
