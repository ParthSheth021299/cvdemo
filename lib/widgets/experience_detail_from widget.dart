import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ExperienceDetailWidget extends StatefulWidget {
  const ExperienceDetailWidget({Key? key}) : super(key: key);

  @override
  State<ExperienceDetailWidget> createState() => _ExperienceDetailWidgetState();
}

class _ExperienceDetailWidgetState extends State<ExperienceDetailWidget> {
  List<TextEditingController> companyController = [];
  List<TextEditingController> jobController = [];
  List<TextEditingController> detailsController = [];
  List<TextEditingController> startController = [];
  List<TextEditingController> endController = [];

  List<String> companyName = [];
  List<String> jobTitle = [];
  List<String> startDate = [];
  List<String> endDate = [];
  List<String> details = [];

  final _formKey = GlobalKey<FormState>();
  bool isSubmitted = false;
  int count = 1;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < count; i++) {
      companyController.add(TextEditingController());
      jobController.add(TextEditingController());
      detailsController.add(TextEditingController());
      startController.add(TextEditingController());
      endController.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (TextEditingController controller in companyController) {
      controller.dispose();
    }
    for (TextEditingController controller in jobController) {
      controller.dispose();
    }
    for (TextEditingController controller in detailsController) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience Detail'),
        actions: [
          IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {

                  for (int i = 0; i < count; i++) {
                    companyName.insert(i, companyController[i].text);
                    jobTitle.insert(i, jobController[i].text);
                    startDate.insert(i, startController[i].text);
                    endDate.insert(i, endController[i].text);
                    details.insert(i, detailsController[i].text);
                  }
                  print(
                      'Experience details  COMPANY NAME ${companyName}  JOB TITLE ${jobTitle}  START DATE ${startDate} END DATE ${endDate}  DETAILS ${details}');
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Experience details save successfully')));
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Form(
        autovalidateMode: isSubmitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 75),
          child: ScrollablePositionedList.builder(
            itemCount: count,
            itemBuilder: (context, index) {
              print('INDEX VALUE $index');
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (count > 1) {
                                    setState(() {
                                      count -= 1;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'You cannot delete this item')));
                                  }
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text('Company Name')),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: companyController[index],
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
                            controller: jobController[index],
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
                                  TextField(
                                    controller: startController[index],
                                    //editing controller of this TextField
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.calendar_today),
                                      //icon of text field
                                      labelText: "Enter Date",
                                      //label text of field
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
                                    /*decoration: InputDecoration(
                                        icon: Icon(Icons.calendar_today), //icon of text field
                                        labelText: "Enter Date" //label text of field
                                    ),*/
                                    readOnly: true,
                                    //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime(2100));

                                      if (pickedDate != null) {
                                        print(
                                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        print(
                                            formattedDate); //formatted date output using intl package =>  2021-03-16
                                        setState(() {
                                          startController[index].text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      } else {}
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
                                  TextField(
                                    controller: endController[index],
                                    //editing controller of this TextField
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.calendar_today),
                                      //icon of text field
                                      labelText: "Enter Date",
                                      //label text of field
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

                                    readOnly: true,
                                    //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime(2100));

                                      if (pickedDate != null) {
                                        print(
                                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        print(
                                            formattedDate); //formatted date output using intl package =>  2021-03-16
                                        setState(() {
                                          endController[index].text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      } else {}
                                    },
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text('Details')),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: detailsController[index],
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
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            count += 1;
            companyController.add(TextEditingController());
            detailsController.add(TextEditingController());
            jobController.add(TextEditingController());
            startController.add(TextEditingController());
            endController.add(TextEditingController());
          });
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
