import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

/// Created by Parth Sheth.
/// Created on 03/05/23 at 12:52 pm

class ReferenceFormWidget extends StatefulWidget {
  const ReferenceFormWidget({Key? key}) : super(key: key);

  @override
  State<ReferenceFormWidget> createState() => _ReferenceFormWidgetState();
}

class _ReferenceFormWidgetState extends State<ReferenceFormWidget> {
  int count = 1;

  List<String> name = [];
  List<String> jobTitle = [];
  List<String> companyName = [];
  List<String> phone = [];
  List<String> email = [];

  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> nameController = [];
  List<TextEditingController> jobTitleController = [];
  List<TextEditingController> companyNameController = [];
  List<TextEditingController> phoneController = [];
  List<TextEditingController> emailController = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < count; i++) {
      nameController.add(TextEditingController());
      jobTitleController.add(TextEditingController());
      companyNameController.add(TextEditingController());
      phoneController.add(TextEditingController());
      emailController.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (TextEditingController controller in nameController) {
      controller.dispose();
    }
    for (TextEditingController controller in jobTitleController) {
      controller.dispose();
    }
    for (TextEditingController controller in phoneController) {
      controller.dispose();
    }
    for (TextEditingController controller in emailController) {
      controller.dispose();
    }
    for (TextEditingController controller in companyNameController) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ScrollablePositionedList.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children:  [
                        Container(
                          decoration: const BoxDecoration(
                            // borderRadius: ,
                            color: Colors.grey
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Reference ${index+1}',style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),),
                              IconButton(onPressed: (){
                                if (count == 1) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'You cannot delete this item')));
                                } else {
                                  setState(() {
                                    count -= 1;
                                  });
                                  nameController.removeAt(index);
                                  jobTitleController.removeAt(index);
                                  phoneController.removeAt(index);
                                  emailController.removeAt(index);
                                  companyNameController.removeAt(index);
                                }
                              }, icon: const Icon(Icons.delete))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ///Name
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Refer Name")),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: nameController[index],
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                      borderSide: BorderSide(color: Colors.red)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter refer name';
                                  }
                                  return null;
                                },
                              ),

                              ///Job title
                              const SizedBox(
                                height: 10,
                              ),
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Job title')),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: jobTitleController[index],
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                      borderSide: BorderSide(color: Colors.red)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter job title';
                                  }
                                  return null;
                                },
                              ),

                              ///Company name
                              const SizedBox(
                                height: 10,
                              ),
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Company name')),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: companyNameController[index],
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                      borderSide: BorderSide(color: Colors.red)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter company name';
                                  }
                                  return null;
                                },
                              ),

                              ///Email
                              const SizedBox(
                                height: 10,
                              ),
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Email')),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: emailController[index],
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                      borderSide: BorderSide(color: Colors.red)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                              ),


                              ///Phone
                              const SizedBox(
                                height: 10,
                              ),
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Phone')),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: phoneController[index],
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2),
                                      ),
                                      borderSide: BorderSide(color: Colors.red)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter phone';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  );
                },
                itemCount: count,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      count += 1;
                      nameController.add(TextEditingController());
                      jobTitleController.add(TextEditingController());
                      phoneController.add(TextEditingController());
                      emailController.add(TextEditingController());
                      companyNameController.add(TextEditingController());
                    });
                  },
                  label: const Text('Add'),
                  icon: const Icon(Icons.add),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      for (int i = 0; i < count; i++) {
                        companyName.insert(i, companyNameController[i].text);
                        jobTitle.insert(i, jobTitleController[i].text);
                        name.insert(i, nameController[i].text);
                        phone.insert(i, phoneController[i].text);
                        email.insert(i, emailController[i].text);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Reference save successfully')));
                    }
                  },
                  label: const Text('Save'),
                  icon: const Icon(Icons.save),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
