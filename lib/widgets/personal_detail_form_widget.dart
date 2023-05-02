import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../provider/personal_detail_provider.dart';


/// Created by Parth Sheth.
/// Created on 06/04/23 at 5:33 PM

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
  File? image;
  final _formKey = GlobalKey<FormState>();
  bool isSubmitted = false;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException {
      //print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        autovalidateMode: isSubmitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(alignment: Alignment.topLeft, child: Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(alignment: Alignment.topLeft, child: Text('Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                maxLines: 4,
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(alignment: Alignment.topLeft, child: Text('Email',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(alignment: Alignment.topLeft, child: Text('Phone',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Photo (Optional)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(2)),
                        border: Border.all(color: Colors.black87)),
                    child: image == null
                        ? const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                                child: Text(
                              'No image selected',
                              textAlign: TextAlign.center,
                            )),
                          )
                        : Image.file(image!,fit: BoxFit.fill,),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await pickImage();
                      },
                      child: const Text('Change')),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                     setState(() {
                       image = null;
                     });
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child:  const Text('Remove'),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    isSubmitted = true;
                  });
                  // print('Name: ${nameController.text}');
                  // print('Address: ${addressController.text}');
                  // print('Email: ${emailController.text}');
                  // print('Phone: ${phoneController.text}');
                  // print('ImageUrl: ${image?.path.toString()}');
                  if (_formKey.currentState!.validate()) {
                    PersonalDetailProvider().addPersonalDetail(
                        nameController.text,
                        addressController.text,
                        emailController.text,
                        phoneController.text,
                        image?.path == null ? '' : image!.path.toString());
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Personal Details save successfully')));
                  }

                },
                icon: const Icon(Icons.save),
                label: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
