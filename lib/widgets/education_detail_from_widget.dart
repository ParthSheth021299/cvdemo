import 'package:flutter/material.dart';
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
    print('Set State USed');
    return Form(
        key: educationFormKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
          child: Column(children: [
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              yearController: yearController[index],
                            )
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
                    setState(() {
                      count += 1;
                      courseController.add(TextEditingController());
                      schoolController.add(TextEditingController());
                      gradeController.add(TextEditingController());
                      yearController.add(TextEditingController());
                    });
                  },
                  label: Text('Add'),
                  icon: Icon(Icons.add),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    List<EducationDetailModel> educationDetailModel = [];
                    if (educationFormKey.currentState!.validate()) {
                      setState(() {
                        isSubmitted = true;
                      });
                      for (int i = 0; i < count; i++) {
                        courseValues.insert(i, courseController[i].text);
                        schoolValues.insert(i, schoolController[i].text);
                        gradeValues.insert(i, gradeController[i].text);
                        yearValues.insert(i, yearController[i].text);
                        educationDetailModel.add(EducationDetailModel(
                            course: courseController[i].text,
                            school: schoolController[i].text,
                            grade: gradeController[i].text,
                            year: yearController[i].text));
                      }
                      print('Data:${educationDetailModel}');
                      EducationDetailProvider().addEducationDetail(educationDetailModel);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('education save successfully')));
                    }
                  },
                  label: Text('Save'),
                  icon: Icon(Icons.done),
                )
              ],
            )
          ]),
        ));
  }

}
