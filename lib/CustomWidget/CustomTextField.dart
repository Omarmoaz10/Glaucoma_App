import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTextField extends StatelessWidget {
  @override
  final text;
  final TextEditingController Controller;
  final FocusNode focusNode;
  final Function EditingComplete;
  final  Function(String) actionChanging;
  final Function(String) validator;
  final IconData icon;
  final String errorMsg;
  final String placeholder;
  final TextInputType inputType;
  const CustomTextField({Key key, this.text,this.validator, @required this.Controller, @required this.focusNode, this.EditingComplete, this.actionChanging, this.icon,   this.errorMsg,@required this.placeholder,@required this.inputType}) : super(key: key);
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text==null?"":text ,style: TextStyle(fontWeight: FontWeight.bold,),),
        TextFormField(
          validator: validator,
          controller: Controller,
          focusNode: focusNode,
          cursorColor: SecondaryTextColor,
          decoration: InputDecoration(
            suffixIcon: Icon(
              icon ,
              color: SecondaryTextColor,
            ),
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            errorText: errorMsg,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: SecondaryTextColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: DarkGray),
            ),
          ),
          keyboardType: inputType,
          textInputAction: TextInputAction.next,
          onEditingComplete: EditingComplete,
          onChanged: actionChanging,
        ),
      ],
    );
  }
}
