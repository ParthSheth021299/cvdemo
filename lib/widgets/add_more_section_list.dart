import 'package:flutter/material.dart';

class AddMoreSectionList extends StatefulWidget {
  const AddMoreSectionList({
    super.key,
    required this.index,
    // required this.interestController,
    // required this.achievements,
    // required this.activities,
    // required this.publications,
    // required this.additionalInfo,
    // required this.projects,
  });

  final int index;

  // final TextEditingController interestController;
  // final TextEditingController achievements;
  // final TextEditingController activities;
  // final TextEditingController publications;
  // final TextEditingController additionalInfo;
  // final TextEditingController projects;

  @override
  State<AddMoreSectionList> createState() => _AddMoreSectionListState();
}

class _AddMoreSectionListState extends State<AddMoreSectionList> {
  bool interest = false;
  bool achievements = false;
  bool activities = false;
  bool publications = false;
  bool language = false;
  bool additionalInfo = false;
  bool projects = false;
  bool signature = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                  'Note: Click Toggle/Switch button to add/remove the section'),
            )),
        SizedBox(
          height: 10,
        ),
        Divider(),
        switchText('Interest', interest, (bool value) {
          setState(() {
            interest = value;
          });
        }),
        Divider(),
        switchText('Achievements & Awards', achievements, (bool value1) {
          setState(() {
            achievements = value1;
          });
        }),
        Divider(),
        switchText('Activities', activities, (bool value2) {
          setState(() {
            activities = value2;
          });
        }),
        Divider(),
        switchText('Publications', publications, (bool value3) {
          setState(() {
            publications = value3;
          });
        }),
        Divider(),
        switchText('Language', language, (bool value4) {
          setState(() {
            language = value4;
          });
        }),
        Divider(),
        switchText('Additional Information', additionalInfo, (bool value5) {
          setState(() {
            additionalInfo = value5;
          });
        }),
        Divider(),
        switchText('Projects', projects, (bool value6) {
          setState(() {
            projects = value6;
          });
        }),
        Divider(),
        switchText('Signature', signature, (bool value7) {
          setState(() {
            signature = value7;
          });
        }),
        SizedBox(
          height: 10,
        ),
        Card(
          child: Column(
            children: [
              Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade400,
                  ),
                  child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Create New Section',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]))),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                        'Note: If the Section you nedd is not present in the above list, you can create your own custom section '),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 330,
                height: 30,
                child: ElevatedButton(onPressed: () {},
                  child: Text('Create New Section',style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade400,
                )
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        )
      ],
    );
  }

  switchText(text, value, onchange) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Switch(value: value, activeColor: Colors.grey, onChanged: onchange)
      ],
    );
  }
}
