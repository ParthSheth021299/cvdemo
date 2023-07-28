import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'add_more_section_list.dart';

class AddMoreSectionWidget extends StatefulWidget {
  const AddMoreSectionWidget({super.key});

  @override
  State<AddMoreSectionWidget> createState() => _AddMoreSectionWidgetState();
}

class _AddMoreSectionWidgetState extends State<AddMoreSectionWidget> {
  bool isSubmitted = false;
  int count = 1;
  final addMoreFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: isSubmitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        key: addMoreFormKey,
        child: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
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
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade400,
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Add More Section',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]))),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AddMoreSectionList(
                                        index: index,
                                        // interestController: [index],
                                        // achievements: null,
                                        // activities: null,
                                        // publications: null,
                                        // additionalInfo: null,
                                        // projects: null,
                                      )
                                  )

                                ]));
                      }))
            ])));
  }
}
