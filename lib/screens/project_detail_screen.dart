import 'package:flutter/material.dart';
import '../widgets/project_detail_form.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project'),
      ),
      body: const ProjectDetailsWidget(),
    );
  }
}
