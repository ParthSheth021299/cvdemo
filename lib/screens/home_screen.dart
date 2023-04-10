import 'package:flutter/material.dart';

import '../widgets/button_list_widget.dart';
import '../widgets/custom_drawer_widget.dart';

/**
 * Created by Parth Sheth.
 * Created on 05/04/23 at 3:43 PM
**/


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CV Creation'),
      ),
      drawer: CustomDrawerWidget(),
      body: ButtonListWidget(),
    );
  }
}
