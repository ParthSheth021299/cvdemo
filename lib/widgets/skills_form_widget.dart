/*
import 'package:flutter/material.dart';

import '../provider/skill_data_provider.dart';
import 'custom_skill_textfield_widget.dart';

*/
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../provider/skill_data_provider.dart';

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
  const SkillFormWidget({super.key});

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
      ),
      body: Form(
        key: formKey,
        child: ScrollablePositionedList.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 50),
              child: Card(
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromRGBO(110, 110, 110 ,1),
                                Color.fromRGBO(189, 189, 189 ,1),
                              ],
                            ),
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
                                  if (count == 1) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'You cannot delete this item')));
                                  } else {
                                    setState(() {
                                      count -= 1;
                                    });
                                    controllers.removeAt(index);
                                    skillLevels.removeAt(index);
                                  }

                                }, icon: FaIcon(FontAwesomeIcons.trash,color:Colors.red))
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.blue
              )
            ),
            onPressed: () {
            setState(() {
              count += 1;
              controllers.add(TextEditingController());
              skillLevels.add(SkillLevel.level1);
            });
          }, icon: FaIcon(FontAwesomeIcons.add,color:Colors.white),
          label: Text('Add',style: TextStyle(color: Colors.white),),),
          ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    Colors.green
                )
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                for (int i = 0; i < count; i++) {
                  skillValues.insert(i, controllers[i].text);
                }
                SkillDataProvider().addSkillDetail(skillValues, skillLevels.map((skillLevel) => skillLevel.toString().split('.').last).toList());
                ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Skill save successfully')));
              }
            }, icon: FaIcon(FontAwesomeIcons.solidSave,color:Colors.white),
            label: Text('Save',style: TextStyle(color: Colors.white),),)
        ],
      ),

    );
  }
}
