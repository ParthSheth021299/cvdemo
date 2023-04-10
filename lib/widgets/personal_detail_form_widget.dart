import 'package:flutter/material.dart';

/**
 * Created by Parth Sheth.
 * Created on 06/04/23 at 5:33 PM
 */

class PersonalDetailWidget extends StatefulWidget {
  const PersonalDetailWidget({Key? key}) : super(key: key);

  @override
  State<PersonalDetailWidget> createState() => _PersonalDetailWidgetState();
}

class _PersonalDetailWidgetState extends State<PersonalDetailWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(alignment: Alignment.topLeft, child: Text('Name')),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2)),
                  labelText: 'Enter your name',
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(alignment: Alignment.topLeft, child: Text('Address')),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2)),
                  labelText: 'Enter your address',
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                      borderSide: BorderSide(color: Colors.red)),
                ),
                maxLines: 4,
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(alignment: Alignment.topLeft, child: Text('Email')),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2)),
                  labelText: 'Enter your email',
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(alignment: Alignment.topLeft, child: Text('Phone')),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2)),
                  labelText: 'Enter your phone number',
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Photo (Optional)')),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(2)),
                        border: Border.all(color: Colors.black87)),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Change')),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Remove'),
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
