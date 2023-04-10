import 'package:flutter/material.dart';

import '../widgets/contactus_form_widget.dart';

/**
 * Created by Parth Sheth.
 * Created on 07/04/23 at 3:23 PM
 */

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: ContactUsFormWidget(),
        ),
      ),
    );
  }
}
