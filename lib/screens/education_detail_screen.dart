import 'package:flutter/material.dart';

import '../widgets/education_detail_from_widget.dart';


class EducationDetailScreen extends StatelessWidget {
  const EducationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Eduction Detail'),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.save))
          ],
        ),
        body: const EducationDetailWidget(),
      ),
    );
  }
}