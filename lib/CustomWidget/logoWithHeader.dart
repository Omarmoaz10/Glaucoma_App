import 'package:flutter/material.dart';
import 'package:glaucoma_app/CustomWidget/logo.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class LogoWithHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height:20,
        ),
        Logo(),
        Text(
          "Diagnose your patients with more\n confidence & accuracy",
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
            color: LogoColor,
          ),
          ),
        ),

        SizedBox(
          height:30,
        ),
      ],
    );
  }
}
