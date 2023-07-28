import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  var educationProvider;
  int? firstCardIndex;
  int? secondCardIndex;

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

  void swapCard(int newIndex, int oldIndex) {
    setState(() {
      if (newIndex >= count) {
        newIndex = count - 1;
      }
    });
    final tempCourseController = courseController.removeAt(oldIndex);
    final tempSchoolController = schoolController.removeAt(oldIndex);
    final tempGradeController = gradeController.removeAt(oldIndex);
    final tempYearController = yearController.removeAt(oldIndex);

    courseController.insert(newIndex, tempCourseController);
    schoolController.insert(newIndex, tempSchoolController);
    gradeController.insert(newIndex, tempGradeController);
    yearController.insert(newIndex, tempYearController);

    setState(() {
      count = courseController.length;
      firstCardIndex = newIndex;
      secondCardIndex = oldIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: isSubmitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        key: educationFormKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
          child: Column(children: [
            Expanded(
              child: ReorderableListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      key: Key('card$index'),
                      elevation: 2,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color.fromRGBO(110, 110, 110 ,1),
                                    Color.fromRGBO(189, 189, 189 ,1),
                                  ],
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Education ${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            if (count == 1) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          'You cannot delete this item')));
                                            } else {
                                              setState(() {
                                                count -= 1;
                                              });
                                              courseController.removeAt(index);
                                              schoolController.removeAt(index);
                                              gradeController.removeAt(index);
                                              yearController.removeAt(index);
                                            }

                                          },
                                          icon: FaIcon(FontAwesomeIcons.trash,color:Colors.red))
                                    ],
                                  )
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
                                yearController: yearController[index],
                              ))
                        ],
                      ),
                    );
                  },
                  itemCount: count ,
                  onReorder: (oldIndex, newIndex) {
                    print('OLD INDEX ${oldIndex}');
                    print('NEW INDEX ${newIndex}');
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex = newIndex - 1;
                      }
                    });
                    final tempCourseController =
                    courseController.removeAt(oldIndex);
                    final tempSchoolController =
                    schoolController.removeAt(oldIndex);
                    final tempGradeController =
                    gradeController.removeAt(oldIndex);
                    final tempYearController =
                    yearController.removeAt(oldIndex);

                    courseController.insert(newIndex, tempCourseController);
                    schoolController.insert(newIndex, tempSchoolController);
                    gradeController.insert(newIndex, tempGradeController);
                    yearController.insert(newIndex, tempYearController);
                  })
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)
                  ),
                  onPressed: () {
                    setState(() {
                      count += 1;
                      courseController.add(TextEditingController());
                      schoolController.add(TextEditingController());
                      gradeController.add(TextEditingController());
                      yearController.add(TextEditingController());
                    });
                  },
                  label: Text('Add',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                  icon: FaIcon(FontAwesomeIcons.add,color:Colors.white)
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)
                  ),
                  onPressed: () {
                    setState(() {
                      isSubmitted = true;
                    });
                    List<EducationDetailModel> educationDetailModel = [];
                    if (educationFormKey.currentState!.validate()) {
                      for (int i = 0; i < count; i++) {
                        courseValues.insert(i, courseController[i].text);
                        schoolValues.insert(i, schoolController[i].text);
                        gradeValues.insert(i, gradeController[i].text);
                        yearValues.insert(i, yearController[i].text);
                        educationDetailModel.add(EducationDetailModel(
                            course: courseController[i].text,
                            school: schoolController[i].text,
                            grade: gradeController[i].text,
                            year: yearController[i].text,
                            id: ''));
                      }
                      print('Data:${educationDetailModel}');
                      // EducationDetailProvider().addEducationDetail(educationDetailModel);
                      EducationDetailProvider().fetchList();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('education save successfully')));
                    }
                  },
                  label: Text('Save',style: TextStyle(color: Colors.white),),
                  icon: FaIcon(FontAwesomeIcons.solidSave,color:Colors.white)
                )
              ],
            )
          ]),
        ));
  }
}
