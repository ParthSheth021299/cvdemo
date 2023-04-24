import 'package:flutter/material.dart';

import '../provider/skill_data_provider.dart';
import 'custom_skill_textfield_widget.dart';

/**
 * Created by Parth Sheth.
 * Created on 14/04/23 at 3:03 PM
 */

enum SkillLevel {
  level1,
  level2,
  level3,
  level4,
  level5,
}

class SkillFormWidget extends StatefulWidget {
  const SkillFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SkillFormWidget> createState() => _SkillFormWidgetState();
}

class _SkillFormWidgetState extends State<SkillFormWidget> {
  int count = 1;
  final formKey = GlobalKey<FormState>();
  TextEditingController skillEditController = TextEditingController();
  String? oldValue;
  double skillValue = 2;
  final String _savedText = '';
  String? skillLevelValue;
  List<double> sliderValues = [];
  List<String> skillValues = [];

  var skillEditControllerList = [];

  void incrementCard() {
    setState(() {
      count = count + 1;
    });
  }

  void decrementCard() {
    setState(() {
      count = count - 1;
    });
  }

  createControllers() {
    for (var i = 0; i < count; i++) {
      skillEditControllerList.add(TextEditingController(text: _savedText));
      // placeClueFocusNodes.add(FocusNode());
    }
  }


  @override
  void initState() {
    createControllers();

    sliderValues.add(0.0);
    super.initState();
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      count = count - 1;
      //final item = 'Item ${oldIndex + 1}';
      count = count + 1;
      if (newIndex > count - 1) newIndex = count - 1;
    });
  }
  void updateSliderValue(int index, double value) {
    setState(() {
      sliderValues[index] = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            skillEditControllerList.length == 0
                ? const Center(
              child: Text('No skill added'),
            )
                : Expanded(
              child: ReorderableListView.builder(
                onReorder: _onReorder,
                itemBuilder: (BuildContext context, int index) {
                  print(index);
                  return Card(
                    key: Key('card${index}'),
                    elevation: 2,
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(2)),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Skill ${index + 1}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      decrementCard();
                                      skillEditControllerList
                                          .removeAt(index);
                                    },
                                    icon: const Icon(Icons.delete)),
                              ],
                            )),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomSkillTextFieldWidget(
                            controller: skillEditControllerList[index], index: index,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Select level',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                        ),
                        Slider(
                          value: sliderValues[index],
                          min: 0.0,
                          max: 5.0,
                          onChanged: (double value) {
                            updateSliderValue(index,value);
                          },
                        ),
                        Text('${sliderValues[index].roundToDouble()}'),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: count,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      incrementCard();
                      skillEditControllerList.add(TextEditingController());
                    },
                    label: const Text('Add'),
                    icon: const Icon(Icons.add),
                  ),

                  ///
                  ElevatedButton.icon(
                    onPressed: () {
                      if (formKey.currentState!.validate()){
                        for (int i = 0; i < count; i++) {
                          skillValues.insert(i, skillEditControllerList[i].text);

                        }
                        print('SliderLength-->${skillValues.length}');
                        SkillDataProvider().addPersonalDetail(skillValues, sliderValues);
                        print('Count-->${count}');
                        print('Skill List-->${skillValues}');
                        print('Skill Level-->${sliderValues}');
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Skill Added Successfully')));
                      } else {
                        print('Invalid');
                      }
                    },
                    label: const Text('Save'),
                    icon: const Icon(Icons.save),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
