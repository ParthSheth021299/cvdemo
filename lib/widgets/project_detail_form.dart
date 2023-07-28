import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/project_detail_model.dart';
import '../provider/project_detail_provider.dart';
import 'custom_project_textfield_widget.dart';

class ProjectDetailsWidget extends StatefulWidget {
  const ProjectDetailsWidget({super.key});

  @override
  State<ProjectDetailsWidget> createState() => _ProjectDetailsWidgetState();
}

class _ProjectDetailsWidgetState extends State<ProjectDetailsWidget> {

  bool isSubmitted = false;
  int count = 1;
  final projectFormKey = GlobalKey<FormState>();
  List<String> titleValues = [];
  List<String> descriptionValues = [];
  List<TextEditingController> titleController = [];
  List<TextEditingController> descriptionController = [];
  var educationProvider;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < count; i++) {
      titleController.add(TextEditingController());
      descriptionController.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (TextEditingController controller in titleController) {
      controller.dispose();
    }
    for (TextEditingController controller in descriptionController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Set State USed');
    return Form(
        autovalidateMode: isSubmitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        key: projectFormKey,
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
                                  'Project ${index + 1}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        count -= 1;
                                      });
                                      titleController.removeAt(index);
                                      descriptionController.removeAt(index);

                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ProjectList(
                              index: index,
                              titleController: titleController[index],
                              descriptionController: descriptionController[index],
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
                      titleController.add(TextEditingController());
                      descriptionController.add(TextEditingController());
                    });
                  },
                  label: Text('Add'),
                  icon: Icon(Icons.add),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isSubmitted = true;
                    });
                    List<ProjectDetailModel> educationDetailModel = [];
                    if (projectFormKey.currentState!.validate()) {
                      for (int i = 0; i < count; i++) {
                        titleValues.insert(i, titleController[i].text);
                        descriptionValues.insert(i, descriptionController[i].text);
                        educationDetailModel.add(ProjectDetailModel(
                            title: titleController[i].text,
                            description: descriptionController[i].text,
                            id: ''));
                      }
                      print('Data:${educationDetailModel}');
                      // EducationDetailProvider().addEducationDetail(educationDetailModel);
                      ProjectDetailProvider().fetchList();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Project save successfully')));
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

