/*
import 'package:flutter/material.dart';

import '../provider/skill_data_provider.dart';
import 'custom_skill_textfield_widget.dart';

*/
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../provider/skill_data_provider.dart';

/**
 * Created by Parth Sheth.
 * Created on 14/04/23 at 3:03 PM
 */ /*


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
  String _savedText = '';
  String? skillLevelValue;
  List<double> sliderValues = [];
  List<String> skillValues = [];
  List<TextEditingController> controllers = [];
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
      skillEditControllerList.add(TextEditingController());
      // placeClueFocusNodes.add(FocusNode());
    }
  }


  @override
  void initState() {
    createControllers();

    sliderValues.add(0.0);
    for (int i = 0; i < count; i++) {
      controllers.add(TextEditingController());
    }
    super.initState();
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      count = count - 1;
      final item = 'Item ${oldIndex + 1}';
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
  void dispose() {
    for (TextEditingController controller in controllers) {
      controller.dispose();
    }
    super.dispose();
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
                          child: TextFormField(
                            controller: controllers[index], // Use the corresponding controller for this TextFormField
                            decoration: InputDecoration(
                              labelText: 'Item ${index + 1}',
                              border: OutlineInputBorder(),
                            ),
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
                      // incrementCard();
                      setState(() {
                        count = count + 1;
                      });
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

  Widget textFormField(TextEditingController controller, int index) {
    print('Index inside TextEditingController${index}');
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // initialValue: oldValue.isEmpty? 'Hello' : oldValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2)),
        labelText: 'Enter your skills',
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
            borderSide: BorderSide(color: Colors.red)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          for (int i = 0; i < index; i++) {
            if (controller.text.isEmpty) {
              return "Clues can't be empty";
            }
          }
          return "Clues can't be empty";
        }
        return null;
      },
    );
  }

}
*/

enum SkillLevel {
  level1,
  level2,
  level3,
  level4,
  level5,
}

class SkillFormWidget extends StatefulWidget {
  @override
  _SkillFormWidgetState createState() => _SkillFormWidgetState();
}

class _SkillFormWidgetState extends State<SkillFormWidget> {
  List<TextEditingController> controllers = [];
  int count = 1;

  SkillLevel skillLevel = SkillLevel.level1;
  List<SkillLevel> skillLevels = [];
  List<String> skillValues = [];
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < count; i++) {
      controllers.add(TextEditingController());
      skillLevels.add(SkillLevel.level1);
    }
  }



  @override
  void dispose() {
    for (TextEditingController controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills'),
        actions: [
          IconButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  for (int i = 0; i < count; i++) {
                    skillValues.insert(i, controllers[i].text);
                  }
                  SkillDataProvider().addPersonalDetail(skillValues, skillLevels.map((skillLevel) => skillLevel.toString().split('.').last).toList());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Skill save successfully')));
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        key: formKey,
        child: ScrollablePositionedList.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Skills ${index + 1}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    count -= 1;
                                  });
                                  controllers.removeAt(index);
                                  skillLevels.removeAt(index);
                                }, icon: Icon(Icons.delete))
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controllers[index],
                        decoration: InputDecoration(
                          labelText: 'Enter skill',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            for (int i = 0; i < index; i++) {
                              if (controllers[index].text.isEmpty) {
                                return "Skill can't be empty";
                              }
                            }
                            return "Skill can't be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: SkillLevel.level1,
                              groupValue: skillLevels[index],
                              onChanged: (SkillLevel? value) {
                                setState(() {
                                  skillLevels[index] = value!;
                                });
                              },
                            ),
                            Text('1'),
                            Radio(
                              value: SkillLevel.level2,
                              groupValue: skillLevels[index],
                              onChanged: (SkillLevel? value) {
                                setState(() {
                                  skillLevels[index] = value!;
                                });
                              },
                            ),
                            Text('2'),
                            Radio(
                              value: SkillLevel.level3,
                              groupValue: skillLevels[index],
                              onChanged: (SkillLevel? value) {
                                setState(() {
                                  skillLevels[index] = value!;
                                });
                              },
                            ),
                            Text('3'),
                            Radio(
                              value: SkillLevel.level4,
                              groupValue: skillLevels[index],
                              onChanged: (SkillLevel? value) {
                                setState(() {
                                  skillLevels[index] = value!;
                                });
                              },
                            ),
                            Text('4'),
                            Radio(
                              value: SkillLevel.level5,
                              groupValue: skillLevels[index],
                              onChanged: (SkillLevel? value) {
                                setState(() {
                                  skillLevels[index] = value!;
                                });
                              },
                            ),
                            Text('5'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count += 1;
            controllers.add(TextEditingController());
            skillLevels.add(SkillLevel.level1);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
