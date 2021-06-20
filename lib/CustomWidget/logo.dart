import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 60,
          padding: EdgeInsets.all(16),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 25,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Glaucoma",
                  style: GoogleFonts.bitter(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                  ),
                ),

              ]),
        ),
      ],
    );
  }
}
