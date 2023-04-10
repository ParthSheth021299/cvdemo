import 'package:flutter/material.dart';

/**
 * Created by Parth Sheth.
 * Created on 07/04/23 at 3:28 PM
 */

class ContactUsFormWidget extends StatefulWidget {
  const ContactUsFormWidget({Key? key}) : super(key: key);

  @override
  State<ContactUsFormWidget> createState() => _ContactUsFormWidgetState();
}

class _ContactUsFormWidgetState extends State<ContactUsFormWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            child: Column(
          children: [
            const Text(
              'Lets be in touch',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            const Text(
              'Send us a message we will respond to you as soon as possible!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),

            TextFormField(),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            ElevatedButton(onPressed: () {}, child: Text('Send')),
          ],
        )),
      ),
    );
  }
}
