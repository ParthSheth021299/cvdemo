import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

/**
 * Created by Parth Sheth.
 * Created on 03/05/23 at 12:52 pm
 */

class ReferenceFormWidget extends StatefulWidget {
  const ReferenceFormWidget({Key? key}) : super(key: key);

  @override
  State<ReferenceFormWidget> createState() => _ReferenceFormWidgetState();
}

class _ReferenceFormWidgetState extends State<ReferenceFormWidget> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ScrollablePositionedList.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children:  [
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: ,
                            color: Colors.grey
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Reference ${index+1}',style: TextStyle(fontWeight: FontWeight.bold),),
                              IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                        Text('Name'),
                      ],
                    ),
                  );
                },
                itemCount: count,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      count += 1;
                    });
                  },
                  label: const Text('Add'),
                  icon: const Icon(Icons.add),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Save'),
                  icon: const Icon(Icons.save),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
