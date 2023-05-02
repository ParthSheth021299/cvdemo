import 'package:flutter/material.dart';

class EducationList extends StatefulWidget {
  const EducationList(
      {Key? key,
      required this.index,
      required this.courseController,
      required this.schoolController,
      required this.gradeController,
      required this.yearController})
      : super(key: key);

  final int index;
  final TextEditingController courseController;
  final TextEditingController schoolController;
  final TextEditingController gradeController;
  final TextEditingController yearController;

  @override
  State<EducationList> createState() => _EducationListState();
}

class _EducationListState extends State<EducationList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(alignment: Alignment.topLeft, child: Text('Course/Degree')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.courseController,
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
                if (widget.courseController.text.isEmpty) {
                  return "Please enter Course/Degree";
                }
              }
              return "Please enter Course/Degree";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const Align(
            alignment: Alignment.topLeft, child: Text('School/ University')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.schoolController,
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
                if (widget.schoolController.text.isEmpty) {
                  return 'Please enter School/University';
                }
              }
              return 'Please enter School/University';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const Align(alignment: Alignment.topLeft, child: Text('Grade/Score')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.gradeController,
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
                if (widget.gradeController.text.isEmpty) {
                  return 'Please enter Grade';
                }
              }
              return 'Please enter Grade';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const Align(alignment: Alignment.topLeft, child: Text('Year')),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.yearController,
          keyboardType: TextInputType.number,
          maxLength: 4,
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
                if (widget.yearController.text.isEmpty) {
                  return 'Please enter year';
                }
              }
              return 'Please enter year';
            }
            return null;
          },
        ),
      ],
    );
  }
}
