import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommonButton extends 
StatefulWidget {
 

  String text;
   CommonButton({super.key, required this.text});

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: ElevatedButton(onPressed: (){}, child: Text('${widget.text}')),);
  }
}