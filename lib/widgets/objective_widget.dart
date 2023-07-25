import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ObjectiveWidget extends StatefulWidget {
  const ObjectiveWidget({super.key});

  @override
  State<ObjectiveWidget> createState() => _ObjectiveWidgetState();
}

class _ObjectiveWidgetState extends State<ObjectiveWidget> {
  TextEditingController objectiveController = TextEditingController();

  ExpansionTileController expansionTileController = ExpansionTileController();

  List<String> customObjectiveText = [
    "Highly motivated recent graduate with a degree in [Your Field] seeking an entry-level position in a dynamic company. I am eager to learn and contribute my creativity and teamwork abilities to achieve the company's objectives.",
    'A skilled [Your Profession] with a passion for innovation and technology, seeking a position in a forward-thinking company where I can use my expertise to develop cutting-edge solutions and drive digital transformation.',
    'An organized and detail-oriented individual seeking a position in [Your Field] to utilize my exceptional organizational and time management skills to streamline processes and ensure optimal project execution.',
    'A dedicated and detail-oriented administrative assistant with a proven ability to handle multiple tasks and prioritize effectively. Seeking a position to provide comprehensive support to executive-level management and contribute to seamless operations.',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Objective'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Objective',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: objectiveController,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  onTap: () {
                    setState(() {
                      expansionTileController.collapse();
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ExpansionTile(
                controller: expansionTileController,

                  shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(115, 110, 120, 1))),
                  tilePadding: EdgeInsets.zero,
                  title: const Text(
                    'Select Objective',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.41,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: customObjectiveText.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0),
                              child: ListTile(
                                onTap: () {
                                  setState(() {
                                    objectiveController.text =
                                        customObjectiveText[index];
                                  });
                                },
                                title: Text(
                                    '${index + 1}. ${customObjectiveText[index]}'),
                                // Add any other widgets you want for each list item
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
