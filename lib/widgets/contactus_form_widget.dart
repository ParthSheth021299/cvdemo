import 'package:flutter/material.dart';


/**
 * Created by Parth Sheth.
 * Created on 07/04/23 at 3:28 PM
 *
 *
 */

class ContactUsFormWidget extends StatefulWidget {
  const ContactUsFormWidget({Key? key}) : super(key: key);

  @override
  State<ContactUsFormWidget> createState() => _ContactUsFormWidgetState();
}

class _ContactUsFormWidgetState extends State<ContactUsFormWidget> {

  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtContactController = TextEditingController();
  TextEditingController txtMessageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
            child: Column(
          children: [
            const Text(
              'Lets be in touch',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            const Text(
              'Send us a message we will respond to you as soon as possible!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),

            const SizedBox(height: 20,),
            TextFormField(
              controller: txtNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2)),
                labelText: 'Name'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),

            const SizedBox(height: 20,),
            TextFormField(
              controller: txtEmailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2)),
                  labelText: 'Email'
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),

            const SizedBox(height: 20,),
            TextFormField(
              controller: txtContactController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2)),
                  labelText: 'Phone Number'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),

            const SizedBox(height: 20,),
            TextFormField(
              controller: txtMessageController,
              maxLines: 5,
              textInputAction: TextInputAction.done, // Set textInputAction to done
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2)),
                  labelText: 'Message',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                txtNameController.text = '';
                txtContactController.text = '';
                txtMessageController.text = '';
                // send email or save data to database
              }

            }, child: const Text('Send')),
          ],
        )),
      ),
    );
  }
}
