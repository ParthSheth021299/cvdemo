import 'package:flutter/material.dart';

class ProjectList extends StatefulWidget {
  const ProjectList(
      {Key? key,
        required this.index,
        required this.titleController,
        required this.descriptionController})
      : super(key: key);

  final int index;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text('Title')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.titleController,
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                borderSide: BorderSide(color: Colors.red)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              for (int i = 0; i <= widget.index; i++) {
                if (widget.titleController.text.isEmpty) {
                  return "Please enter Title";
                }
              }
              return "Please enter Title";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const Align(
            alignment: Alignment.topLeft, child: Text('Description')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.descriptionController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                borderSide: BorderSide(color: Colors.red)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              for (int i = 0; i < widget.index; i++) {
                if (widget.descriptionController.text.isEmpty) {
                  return 'Please enter Description';
                }
              }
              return 'Please enter Description';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
