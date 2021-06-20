import 'package:flutter/material.dart';
import 'colors.dart';

class CustomButton extends StatelessWidget {
  final text;
  final action;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final IconData icon;
  CustomButton(
      {@required this.text,
      @required this.action,
      this.textColor,
      this.bgColor,
      this.borderColor,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              bgColor == null ? PrimaryBottomColor : Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: borderColor != null
                          ? borderColor
                          : PrimaryBottomColor))),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor == null
                            ? Colors.white
                            : PrimaryBottomColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    icon,
                    color: bgColor == Colors.white
                        ? SecondaryTextColor
                        : Colors.white,
                    size: bgColor != Colors.white ? 30.0 : 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
