import 'package:flutter/material.dart';
import 'package:to_do/component/my_button.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
   Dialogbox({
    super.key,
    required this.controller,
     required this.onCancel,
     required this.onSaved
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
         backgroundColor: Colors.yellow[200],
         content: Container(
           height: 120,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               TextField(
                 controller: controller,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Add a new task'
                 ),
               ),

               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   MyButton(text: 'Save', onPressed:onSaved),
                   SizedBox(width: 12),
                   MyButton(text: 'Cancel', onPressed:onCancel)
                 ],
               )
             ],
           ),
         ),
    );
  }
}
