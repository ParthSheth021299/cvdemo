import 'package:flutter/material.dart';
import '../widgets/experience_detail_from widget.dart';


class ExperienceDetailScreen extends StatelessWidget {
  const ExperienceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Experience Detail'),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.save))
        ],
      ),
      body: const ExperienceDetailWidget(),
    );
  }
}
