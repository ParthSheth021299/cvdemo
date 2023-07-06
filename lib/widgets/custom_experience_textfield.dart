import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ExperienceList extends StatefulWidget {
  const ExperienceList({Key? key,
    required this.index,
    required this.companyController,
    required this.jobController,
    required this.detailsController,
    required this.startController,
    required this.endController,
  })
      : super(key: key);

  final int index;
  final TextEditingController companyController;
  final TextEditingController jobController;
  final TextEditingController startController;
  final TextEditingController endController;
  final TextEditingController detailsController;

  @override
  State<ExperienceList> createState() => _ExperienceListState();
}

class _ExperienceListState extends State<ExperienceList> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.topLeft,
            child: Text('Company Name')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.companyController,
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
          controller: widget.jobController,
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
                  controller: widget.startController,
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
                  //editing controller of this TextField
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );
                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(
                          pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        widget.startController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter StartDate';
                    }
                    return null;
                  },
                )
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
                  controller: widget.endController,
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
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                      );

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(
                          pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        widget.endController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("EndDate is not selected");
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter EndDate';
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
            child: Text('Details')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.detailsController,
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
    );
  }
}



