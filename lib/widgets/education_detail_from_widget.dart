import 'package:flutter/material.dart';
import 'education_list_widget.dart';

class EducationDetailWidget extends StatefulWidget {
  const EducationDetailWidget({Key? key}) : super(key: key);

  @override
  State<EducationDetailWidget> createState() => _EducationDetailWidgetState();
}

class _EducationDetailWidgetState extends State<EducationDetailWidget> {

  int count = 1;
  bool isSubmitted = false;


  void increaseCount() {
    setState(() {
      count += 1;
    });
  }

  void decreaseCount() {
    setState(() {
      count -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 75),
        child: ListView.builder(
          itemCount: count,
          itemBuilder: (BuildContext context, index) {
            return Card(
              key:  Key('Card$index'),
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                decreaseCount();
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EducationList(index: index.toString(),)
                  )
                ],
              ),
            );
          },
        ),
      ),
        /*floatingActionButton:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () => increaseCount(),
              label: Text('Add'),
              icon: Icon(Icons.add),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  isSubmitted = true;
                });
                // print('Course: ${courseController.text}');
                // print('School: ${schoolController.text}');
                // print('Score: ${scoreController.text}');
                // print('Year: ${yearController.text}');
                if (_formKey.currentState!.validate()) {
                  EducationDetailProvider().addEducationDetail(
                    courseController.text,
                    schoolController.text,
                    scoreController.text,
                    yearController.text,);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Education Details save successfully')));
                }
              },
              label: Text('Save'),
              icon: Icon(Icons.done),
            ),
          ],
        );*/
    );
  }
}
