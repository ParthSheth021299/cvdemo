import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../models/education_detail_model.dart';
import '../provider/education_detail_provider.dart';
import 'custom_education_textfield_widget.dart';

class EducationDetailWidget extends StatefulWidget {
  const EducationDetailWidget({Key? key}) : super(key: key);

  @override
  State<EducationDetailWidget> createState() => _EducationDetailWidgetState();
}

class _EducationDetailWidgetState extends State<EducationDetailWidget> {
  bool isSubmitted = false;
  int count = 1;
  final educationFormKey = GlobalKey<FormState>();
  List<String> courseValues = [];
  List<String> schoolValues = [];
  List<String> gradeValues = [];
  List<String> yearValues = [];
  List<TextEditingController> courseController = [];
  List<TextEditingController> schoolController = [];
  List<TextEditingController> gradeController = [];
  List<TextEditingController> yearController = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < count; i++) {
      courseController.add(TextEditingController());
      schoolController.add(TextEditingController());
      gradeController.add(TextEditingController());
      yearController.add(TextEditingController());
    }
  }


  @override
  void dispose() {
    for (TextEditingController controller in courseController) {
      controller.dispose();
    }
    for (TextEditingController controller in schoolController) {
      controller.dispose();
    }
    for (TextEditingController controller in gradeController) {
      controller.dispose();
    }
    for (TextEditingController controller in yearController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: educationFormKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 75),
          child: Column(children: [
            if (courseController.isEmpty)
              const Center(
                child: Text('No EducationDetails added'),
              )
            else
              Expanded(
                child: ScrollablePositionedList.builder(
                  itemCount: count,
                  itemBuilder: (BuildContext context, int index) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Education ${index + 1}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          count -= 1;
                                        });
                                        courseController.removeAt(index);
                                        schoolController.removeAt(index);
                                        gradeController.removeAt(index);
                                        yearController.removeAt(index);
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: EducationList(
                                index: index,
                                courseController: courseController[index],
                                schoolController: schoolController[index],
                                gradeController: gradeController[index],
                                yearController: courseController[index],
                              ))
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
                    setState(() {
                      count += 1;
                      courseController.add(TextEditingController());
                      schoolController.add(TextEditingController());
                      gradeController.add(TextEditingController());
                      yearController.add(TextEditingController());
                    });
                  },
                  label: const Text('Add'),
                  icon: const Icon(Icons.add),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (educationFormKey.currentState!.validate()) {
                      for (int i = 0; i < count; i++) {
                        courseValues.insert(i, courseController[i].text);
                        schoolValues.insert(i, schoolController[i].text);
                        gradeValues.insert(i, gradeController[i].text);
                        yearValues.insert(i, yearController[i].text);
                      }
                      List<EducationDetailModel> educationDetailModel = [];
                      Provider.of<EducationDetailProvider>(context,
                              listen: false)
                          .addEducationDetail(educationDetailModel);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('education save successfully')));
                    }
                  },
                  label: const Text('Save'),
                  icon: const Icon(Icons.done),
                )
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
          controller: courseController[index],
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
                if (courseController.isEmpty) {
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
          controller: schoolController[index],
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
                if (schoolController.isEmpty) {
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
          controller: gradeController[index],
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
                if (gradeController.isEmpty) {
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
          controller: yearController[index],
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
                if (yearController.isEmpty) {
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
