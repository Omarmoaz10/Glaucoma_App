
import 'package:flutter/material.dart';

class CustomTableText extends StatefulWidget {
  final text;
  CustomTableText(this.text);
  @override
  _CustomTableTextState createState() => _CustomTableTextState();
}

class _CustomTableTextState extends State<CustomTableText> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Text(widget.text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
    );
  }
}
