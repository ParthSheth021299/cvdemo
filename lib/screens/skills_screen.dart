import 'package:flutter/material.dart';
import '../widgets/skills_form_widget.dart';

/**
 * Created by Parth Sheth.
 * Created on 14/04/23 at 2:58 PM
 */

class SkillScreen extends StatelessWidget {
  const SkillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Skills'),
      ),
      body: SkillFormWidget(),
    );
  }
}
