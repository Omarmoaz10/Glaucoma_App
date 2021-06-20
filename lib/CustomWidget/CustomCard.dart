import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glaucoma_app/CustomWidget/colors.dart';
import 'package:glaucoma_app/CustomWidget/customButton.dart';
import 'package:glaucoma_app/CustomWidget/logoWithHeader.dart';
import 'package:glaucoma_app/UI/SignIn/SignIn.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatefulWidget {
final text;

CustomCard({
  @required this.text,
});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  List<Widget> _buildChildren() {
    return [
      Text("fffff"),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoWithHeader(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: _buildChildren(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: widget.text,
                    action: () {},
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SignIn()))
                    },
                    child: Text(
                      "fjgkhf",
                      style: TextStyle(color: SecondaryTextColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
