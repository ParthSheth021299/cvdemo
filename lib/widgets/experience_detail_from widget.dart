import 'package:flutter/material.dart';

class ExperienceDetailWidget extends StatefulWidget {
  const ExperienceDetailWidget({Key? key}) : super(key: key);

  @override
  State<ExperienceDetailWidget> createState() => _ExperienceDetailWidgetState();
}

class _ExperienceDetailWidgetState extends State<ExperienceDetailWidget> {
  TextEditingController companyController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isSubmitted = false;
  int count = 1;

  void increaseCount() {
    setState(() {
      count += 1;
    });
  }

  void decreaseCount() {
    setState(() {
      count -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 75),
        child: ListView.builder(
          itemCount: count,
          itemBuilder: (BuildContext context, index) {
            return Card(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade400,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Experience ${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                decreaseCount();
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      autovalidateMode: isSubmitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      key: _formKey,
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text('Company Name')),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: companyController,
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
                                return 'Please enter Company';
                              }
                              return null;
                            },
                          ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text('Job Title')),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: jobController,
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
                                return 'Please enter Job Title';
                              }
                              return null;
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(children: [
                                  const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('Start Date')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: startController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      errorBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(2),
                                          ),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter details';
                                      }
                                      return null;
                                    },
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(children: [
                                  const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('End Date')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: endController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      errorBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(2),
                                          ),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter details';
                                      }
                                      return null;
                                    },
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text('details')),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: detailsController,
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
                                return 'Please enter details';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              increaseCount();
            },
            label: const Text('Add'),
            icon: const Icon(Icons.add),
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                isSubmitted = true;
              });
              print('Course: ${companyController.text}');
              print('School: ${jobController.text}');
              print('Score: ${startController.text}');
              print('Year: ${endController.text}');
              if (_formKey.currentState!.validate()) {
                // EducationDetailProvider().addEducationDetail(
                //   courseController.text,
                //   schoolController.text,
                //   scoreController.text,
                //   yearController.text,);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Education Details save successfully')));
              }
            },
            label: const Text('Save'),
            icon: const Icon(Icons.done),
          ),
        ],
      ),
    );
  }
}
/*
Expanded(
flex: 2,
child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
const Align(
alignment: Alignment.topLeft,
child: Text('Start Date')),
TextFormField(
controller: startController,
decoration: InputDecoration(
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(2)),
errorBorder: const OutlineInputBorder(
borderRadius: BorderRadius.all(
Radius.circular(2),
),
borderSide:
BorderSide(color: Colors.red)),
),
validator: (value) {
if (value!.isEmpty) {
return 'Please enter start date';
}
return null;
},
),
const Align(
alignment: Alignment.topLeft,
child: Text('End Date')),
TextFormField(
controller: endController,
decoration: InputDecoration(
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(2)),
errorBorder: const OutlineInputBorder(
borderRadius: BorderRadius.all(
Radius.circular(2),
),
borderSide:
BorderSide(color: Colors.red)),
),
validator: (value) {
if (value!.isEmpty) {
return 'Please enter End Date';
}
return null;
},
),
],
),
),*/
