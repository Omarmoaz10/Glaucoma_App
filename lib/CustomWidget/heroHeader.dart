
import 'package:flutter/material.dart';

import 'CustomNafigatorText.dart';
import 'colors.dart';
import 'logo.dart';

class HeroHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height:20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Logo(),
            Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomNavigatorText(text: "Records",navigatorScreen: "records",textColor: GrayTextColor,),
                  SizedBox(width:20,),
                  CustomNavigatorText(text: "Logout",navigatorScreen: "signIn",textColor: GrayTextColor,),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
