import 'package:cvdemo/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/personal_detail_provider.dart';

/**
 * Created by Parth Sheth.
 * Created on 06/04/23 at 4:02 PM
 */

class CreateCV extends StatefulWidget {
  const CreateCV({Key? key}) : super(key: key);

  @override
  State<CreateCV> createState() => _CreateCVState();
}

class _CreateCVState extends State<CreateCV> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create your cv'),
      ),
      bottomNavigationBar: ElevatedButton.icon(
          style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),

          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
          },
          icon: const Icon(Icons.add),
          label: const Text('Create New Profile')
      ),
    );
  }
}
