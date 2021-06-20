import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glaucoma_app/CustomWidget/CustomTableRowText.dart';
import 'package:glaucoma_app/CustomWidget/CustomTextTable.dart';
import 'package:glaucoma_app/CustomWidget/colors.dart';
import 'package:glaucoma_app/CustomWidget/heroHeader.dart';

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  List<TableRow> _buildChildren() {
    final isLandSpace= (MediaQuery.of(context).orientation==Orientation.landscape);
    return
      [
        TableRow(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
          ),
          children: [
            Container(
              decoration: BoxDecoration(
                // boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 1.0, spreadRadius: 1.0)],
                color: Colors.white,
                border: Border(
                  left: BorderSide(width: 6, color: DarkGreenTextColor),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: CustomTableText("Name"),
              ),
            ),
            CustomTableText("Age"),
            CustomTableText("Diagnosis"),
            CustomTableText("Image"),
          ],
        ),
        TableRow(
          children: _spacingBetweenRows(),
        ),
        //map here
        TableRow(
          decoration: BoxDecoration(
            color: TableColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),

          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(width: 6, color: DarkGreenTextColor),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: CustomTableRowText("Mohamed Ahmed"),
              ),
            ),
            CustomTableRowText("15"),
            (isLandSpace)?
            CustomTableRowText("Glaucoma Positive"):CustomTableRowText("Positive"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/hero.png",
                  height: 32,
                ),
              ],
            )
          ],
        ),
        TableRow(
          children: _spacingBetweenRows(),
        ),
      ];
  }
  @override
  Widget build(BuildContext context) {

    final isLandSpace= (MediaQuery.of(context).orientation==Orientation.landscape);
    return Scaffold(
      body: Column(
        children: [
          HeroHeader(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Show'),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 70,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: _numberController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText : "5" ,
                                  contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            (isLandSpace) ?
                            SizedBox(
                                width: 10,
                              )
                            :SizedBox(
                              width: 1,
                            ),

                            Text("Records"),
                          ],
                        ),

                      ),
                      (isLandSpace) ? Expanded(
                        flex:3,
                        child: SizedBox(
                          width: 20,
                        ),
                      ):SizedBox(
                        width: 7,
                      ),


                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: _controller,
                          //search code
                          onChanged: (value){},
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                          cursorColor: SecondaryTextColor,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                            suffixIcon: Icon(
                              Icons.search,
                              color: SecondaryTextColor,
                            ),
                            hintText: "Search",
                            enabledBorder:OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white, width: 24.0),
                              borderRadius: BorderRadius.circular(14.0),
                            ) ,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white, width: 24.0),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child:(!isLandSpace)? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Table(
                    columnWidths: {
                  0: FlexColumnWidth(),
                  1: FixedColumnWidth(50),
                  2: FixedColumnWidth(70),
                  3: FixedColumnWidth(50),
                  }
                    ,
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: _buildChildren(),
                  ),
                ):ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Table(
                    columnWidths: {
                      0: FixedColumnWidth(300),
                      1: FlexColumnWidth(),
                      2: FlexColumnWidth(),
                      3: FlexColumnWidth(),
                    }
                    ,
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: _buildChildren(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
    List<Widget> _spacingBetweenRows() {
    return [
      Container(
        height: 4,
      ),
      Container(
      ),
      Container(
      ),
      Container(
      )
    ];

  }
}
