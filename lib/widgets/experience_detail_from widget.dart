import 'package:cvdemo/widgets/custom_experience_textfield.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/experience_detail_model.dart';
import '../provider/experience_detail_provider.dart';

class ExperienceDetailWidget extends StatefulWidget {
  const ExperienceDetailWidget({Key? key}) : super(key: key);

  @override
  State<ExperienceDetailWidget> createState() => _ExperienceDetailWidgetState();
}

class _ExperienceDetailWidgetState extends State<ExperienceDetailWidget> {
  List<TextEditingController> companyController = [];
  List<TextEditingController> jobController = [];
  List<TextEditingController> startController = [];
  List<TextEditingController> endController = [];
  List<TextEditingController> detailsController = [];

  List<String> companyValues = [];
  List<String> jobValues = [];
  List<String> startValues = [];
  List<String> endValues = [];
  List<String> detailsValues = [];

  final experienceKey = GlobalKey<FormState>();
  bool isSubmitted = false;
  int count = 1;

  @override
  void initState() {
    for (int i = 0; i < count; i++) {
      companyController.add(TextEditingController());
      jobController.add(TextEditingController());
      startController.add(TextEditingController());
      endController.add(TextEditingController());
      detailsController.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void dispose() {
    for (TextEditingController controller in companyController) {
      controller.dispose();
    }
    for (TextEditingController controller in jobController) {
      controller.dispose();
    }
    for (TextEditingController controller in startController) {
      controller.dispose();
    }
    for (TextEditingController controller in endController) {
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
      body: Form(
        autovalidateMode: isSubmitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        key: experienceKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 75),
          child: ScrollablePositionedList.builder(
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    count -= 1;
                                  });
                                  companyController.removeAt(index);
                                  jobController.removeAt(index);
                                  startController.removeAt(index);
                                  endController.removeAt(index);
                                  detailsController.removeAt(index);
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExperienceList(
                          index: index,
                          companyController: companyController[index],
                          jobController: jobController[index],
                          startController: startController[index],
                          endController: endController[index],
                          detailsController: detailsController[index],
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                count += 1;
                companyController.add(TextEditingController());
                jobController.add(TextEditingController());
                startController.add(TextEditingController());
                endController.add(TextEditingController());
                detailsController.add(TextEditingController());
              });
            },
            label: const Text('Add'),
            icon: const Icon(Icons.add),
          ),
          ElevatedButton.icon(
            onPressed: () {
              List<ExperienceDetailModel> experienceDetailModel = [];
              if (experienceKey.currentState!.validate()) {
                setState(() {
                  isSubmitted = true;
                });
                for (int i = 0; i < count; i++) {
                  companyValues.insert(i, companyController[i].text);
                  jobValues.insert(i, jobController[i].text);
                  startValues.insert(i, startController[i].text);
                  endValues.insert(i, endController[i].text);
                  detailsValues.insert(i, detailsController[i].text);
                  experienceDetailModel.add(ExperienceDetailModel(
                      company: companyController[i].text,
                      job: jobController[i].text,
                      startDate: startController[i].text,
                      endDate: endController[i].text,
                      details: detailsController[i].text,
                      id: ''));
                }
                print('Data:$experienceDetailModel');
                ExperienceDetailProvider()
                    .addExperienceDetail(experienceDetailModel);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('experience save successfully')));
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
