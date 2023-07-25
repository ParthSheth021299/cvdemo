import 'package:flutter/material.dart';

import '../widgets/reference_form_widget.dart';

/**
 * Created by Parth Sheth.
 * Created on 03/05/23 at 12:40 pm
 */

class ReferenceScreen extends StatelessWidget {
  const ReferenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reference'),
      ),
      body: ReferenceFormWidget(),
    );
  }
}
