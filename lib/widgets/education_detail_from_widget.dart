import 'package:flutter/material.dart';
import '../models/education_detail_model.dart';
import '../provider/education_detail_provider.dart';

class EducationDetailWidget extends StatefulWidget {
  const EducationDetailWidget({Key? key}) : super(key: key);

  @override
  State<EducationDetailWidget> createState() => _EducationDetailWidgetState();
}

class _EducationDetailWidgetState extends State<EducationDetailWidget> {
  bool isSubmitted = false;
  int count = 1;
  final String _savedText = '';
  final educationFormKey = GlobalKey<FormState>();
  var educationValues =
      EducationDetailModel(id: '', course: '', school: '', grade: '', year: '');
  var courseControllerList = [];
  var schoolControllerList = [];
  var gradeControllerList = [];
  var yearControllerList = [];

  TextEditingController courseController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController yearController = TextEditingController();


  void increaseCount() {
    setState(() {
      count = count + 1;
    });
  }

  void decreaseCount() {
    setState(() {
      count = count - 1;
    });
  }

  createControllers() {
    for (var i = 0; i < count; i++) {
      courseControllerList.add(TextEditingController(text: _savedText));
      schoolControllerList.add(TextEditingController(text: _savedText));
      gradeControllerList.add(TextEditingController(text: _savedText));
      yearControllerList.add(TextEditingController(text: _savedText));
      // placeClueFocusNodes.add(FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Set State USed');
    return Form(
        key: educationFormKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 75),
          child: Column(children: [
            // courseControllerList.isEmpty
            //     // schoolControllerList.isEmpty
            //     // courseControllerList.isEmpty
            //     // courseControllerList.isEmpty
            //     ? const Center(
            //         child: Text('No EducationDetails added'),
            //       )
            //     :
            Expanded(
              child: ListView.builder(
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  print('Index:$index');
                  print('Count:`$count');
                  return Card(
                    key: Key('card$index'),
                    elevation: 2,
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
                                  'Education ${index + 1}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
                            child: textField(index)
                            // child: EducationList(
                            //   courseController: courseControllerList[index],
                            //   schoolController: schoolControllerList[index],
                            //   gradeController: gradeControllerList[index],
                            //   yearController: yearControllerList[index],
                            //   index: index,
                            // ))
                            )
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    increaseCount();
                    courseControllerList.add(TextEditingController());
                  },
                  label: Text('Add'),
                  icon: Icon(Icons.add),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (educationFormKey.currentState!.validate()) {
                      for (int i = 0; i < count; i++) {
                        educationValues = EducationDetailModel(
                            id: '',
                            course: courseControllerList[i].text,
                            school: schoolControllerList[i].text,
                            grade: gradeControllerList[i].text,
                            year: yearControllerList[i].text);
                        // educationValues.insert(
                        //     i, educationControllerList[i].text);
                      }
                      // print('SliderLength-->${educationValues.length}');
                      EducationDetailProvider().addEducationDetail(
                          courseControllerList.toString(),
                          schoolControllerList.toString(),
                          gradeControllerList.toString(),
                          yearControllerList.toString());
                      print('Count-->$count');
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Skill Added Successfully')));
                    } else {
                      print('Invalid');
                    }

                    // print('Course: ${courseController.text}');
                    // print('School: ${schoolController.text}');
                    // print('Score: ${scoreController.text}');
                    // print('Year: ${yearController.text}');
                    // if (_formKey.currentState!.validate()) {
                    //   EducationDetailProvider().addEducationDetail(
                    //     courseController.text,
                    //     schoolController.text,
                    //     scoreController.text,
                    //     yearController.text,);
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //       content: Text('Education Details save successfully')));
                    // }
                  },
                  label: Text('Save'),
                  icon: Icon(Icons.done),
                ),
              ],
            )
          ]),
        ));
  }

  Widget textField(int index) {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text('Course/Degree')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: courseControllerList[index],
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                borderSide: BorderSide(color: Colors.red)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              for (int i = 0; i <= index; i++) {
              if (courseController.text.isEmpty) {
                return "Please enter Course/Degree";
              }
              }
              return "Please enter Course/Degree";
            }
            return null;
          },
        ),
        const Align(
            alignment: Alignment.topLeft, child: Text('School/ University')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: schoolControllerList[index],
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                borderSide: BorderSide(color: Colors.red)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              for (int i = 0; i < index; i++) {
              if (schoolController.text.isEmpty) {
                return 'Please enter School/University';
              }
               }
              return 'Please enter School/University';
            }
            return null;
          },
        ),
        const Align(alignment: Alignment.topLeft, child: Text('Grade/Score')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: gradeControllerList[index],
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                borderSide: BorderSide(color: Colors.red)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              for (int i = 0; i < index; i++) {
              if (gradeController.text.isEmpty) {
                return 'Please enter Grade';
              }
              }
              return 'Please enter Grade';
            }
            return null;
          },
        ),
        const Align(alignment: Alignment.topLeft, child: Text('year')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: yearControllerList[index],
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                borderSide: BorderSide(color: Colors.red)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              for (int i = 0; i < index; i++) {
              if (yearController.text.isEmpty) {
                return 'Please enter year';
              }
              }
              return 'Please enter year';
            }
            return null;
          },
        ),
      ],
    );
  }
}
