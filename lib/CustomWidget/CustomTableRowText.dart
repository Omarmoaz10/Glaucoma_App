
import 'package:flutter/material.dart';

class CustomTableRowText extends StatefulWidget {
  final text;
  CustomTableRowText(this.text);
  @override
  _CustomTableRowTextState createState() => _CustomTableRowTextState();
}

class _CustomTableRowTextState extends State<CustomTableRowText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.text,style: TextStyle(fontSize: 14),),
    );
  }
}
