import 'package:flutter/material.dart';

import '../widgets/personal_detail_form_widget.dart';

/**
 * Created by Parth Sheth.
 * Created on 06/04/23 at 5:18 PM
 */

class PersonalDetailScreen extends StatelessWidget {
  const PersonalDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Detail'),
      ),
      body: const PersonalDetailWidget(),
    );
  }
}
