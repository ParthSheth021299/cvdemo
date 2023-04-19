import 'package:flutter/material.dart';

class EducationList extends StatefulWidget {
  final String index;
   EducationList({Key? key, required this.index}) : super(key: key);

  @override
  State<EducationList> createState() => _EducationListState();
}

class _EducationListState extends State<EducationList> {
  TextEditingController courseController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController scoreController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: isSubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      key: _formKey,
      child: Column(
        children: [
          const Align(
              alignment: Alignment.topLeft,
              child: Text('Course/Degree')),
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Course/Degree';
              }
              return null;
            },
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Text('School/ University')),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: schoolController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2)),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  ),
                  borderSide: BorderSide(color: Colors.red)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter School/University';
              }
              return null;
            },
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Text('Grade/Score')),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: scoreController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2)),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  ),
                  borderSide: BorderSide(color: Colors.red)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Grade';
              }
              return null;
            },
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Text('year')),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: yearController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2)),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  ),
                  borderSide: BorderSide(color: Colors.red)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter year';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
