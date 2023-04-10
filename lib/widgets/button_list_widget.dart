import 'package:flutter/material.dart';

import '../screens/create_cv_screen.dart';

/**
 * Created by Parth Sheth.
 * Created on 05/04/23 at 4:17 PM
 */

class ButtonListWidget extends StatelessWidget {
  const ButtonListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CreateCV()));
              },
              icon: Icon(Icons.create),
              label: Text('Create new CV')),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.download),
                label: Text('Download CV   ')),
          ),
        ],
      ),
    );
  }
}
