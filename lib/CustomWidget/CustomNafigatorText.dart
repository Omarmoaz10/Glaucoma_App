import 'package:flutter/material.dart';

import 'colors.dart';

class CustomNavigatorText extends StatelessWidget {
  final text;
  final navigatorScreen;
  final Color textColor;
  CustomNavigatorText(
      {@required this.text, @required this.navigatorScreen, this.textColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () => {Navigator.of(context).pushNamed(navigatorScreen)},
      child: Text(
        text,
        style: TextStyle(
            color: textColor != null ? textColor : SecondaryTextColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
