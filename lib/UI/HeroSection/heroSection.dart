import 'package:flutter/material.dart';
import 'package:glaucoma_app/CustomWidget/colors.dart';
import 'package:glaucoma_app/CustomWidget/customButton.dart';
import 'package:glaucoma_app/CustomWidget/heroHeader.dart';

class HeroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLandSpace= (MediaQuery.of(context).orientation==Orientation.landscape);
    return Scaffold(
      body:  Column(
        children: [
          Container(
              height:(isLandSpace)?(MediaQuery.of(context).size.height)*0.3:(MediaQuery.of(context).size.height-200)*0.2,
              child: HeroHeader()),
          Container(
            height: (isLandSpace)?MediaQuery.of(context).size.height*0.7:MediaQuery.of(context).size.height*0.8,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Glaucoma Detection System",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      (isLandSpace)? SizedBox(
                        height: 40,
                      ):SizedBox(
                        height: 20,
                      ),
                      Text(
                        (isLandSpace)?  "Diagnose your patients with more \nconfidence & accuracy":"Diagnose your patients with more confidence & accuracy",
                        style: TextStyle(
                          fontSize: 16,
                          color: LogoColor,
                        ),
                      ),
                      (isLandSpace)? SizedBox(
                        height: 70,
                      ):SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: 150,
                              child: CustomButton(
                                  text: "Start Detection", action: ()=>{Navigator.of(context).pushNamed("patientData")})),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/images/hero.png",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
