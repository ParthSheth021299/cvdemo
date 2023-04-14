import 'package:flutter/material.dart';

class EducationDetailWidget extends StatefulWidget {
  const EducationDetailWidget({Key? key}) : super(key: key);

  @override
  State<EducationDetailWidget> createState() => _EducationDetailWidgetState();
}

class _EducationDetailWidgetState extends State<EducationDetailWidget> {
  TextEditingController courseController = TextEditingController();
  int count = 1;


  void increaseCount(){
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
        padding: const EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 75),
        child: ListView.builder(
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
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text('Education ${index + 1}'),
                        IconButton(onPressed: (){decreaseCount();}, icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Align(alignment: Alignment.topLeft, child: Text('Course/Degree')),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: courseController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                        ),
                        const Align(alignment: Alignment.topLeft, child: Text('School/ University')),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: courseController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                        ),
                        const Align(alignment: Alignment.topLeft, child: Text('Grade/Score')),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: courseController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                        ),
                        const Align(alignment: Alignment.topLeft, child: Text('year')),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: courseController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(onPressed: (){increaseCount();}, label: Text('Add'), icon: Icon(Icons.add),),
          ElevatedButton.icon(onPressed: (){}, label: Text('Save'), icon: Icon(Icons.done),),
        ],
      ),
    );
  }
}
