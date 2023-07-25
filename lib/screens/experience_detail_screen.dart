import 'package:flutter/material.dart';
import '../widgets/experience_detail_from widget.dart';

class ExperienceDetailScreen extends StatelessWidget {
  const ExperienceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: ExperienceDetailWidget(),
    );
  }
}
