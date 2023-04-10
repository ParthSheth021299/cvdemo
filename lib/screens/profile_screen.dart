import 'package:flutter/material.dart';

import '../widgets/components_widget.dart';

/**
 * Created by Parth Sheth.
 * Created on 06/04/23 at 4:23 PM
 */
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      bottomNavigationBar: ElevatedButton.icon(onPressed: (){}, label: const Text('View CV'), icon: const Icon(Icons.remove_red_eye),),
      body: const ComponentsWidget(),
    );
  }
}
