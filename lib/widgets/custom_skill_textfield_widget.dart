import 'package:flutter/material.dart';

/**
 * Created by Parth Sheth.
 * Created on 17/04/23 at 11:48 AM
 */

class CustomSkillTextFieldWidget extends StatefulWidget {
   CustomSkillTextFieldWidget({Key? key, required this.controller, required this.index, }) : super(key: key);
  final TextEditingController controller;
  final int index;



  @override
  State<CustomSkillTextFieldWidget> createState() => CustomSkillTextFieldWidgetState();
}

class CustomSkillTextFieldWidgetState extends State<CustomSkillTextFieldWidget> {



  @override
  Widget build(BuildContext context,) {

    return TextFormField(
      controller: widget.controller,
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
          for (int i = 0; i < widget.index; i++) {
            if (widget.controller.text.isEmpty) {
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
