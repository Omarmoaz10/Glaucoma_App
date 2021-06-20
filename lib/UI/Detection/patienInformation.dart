import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glaucoma_app/CustomWidget/CustomTextField.dart';
import 'package:glaucoma_app/CustomWidget/colors.dart';
import 'package:glaucoma_app/CustomWidget/customButton.dart';
import 'package:glaucoma_app/CustomWidget/validator.dart';
import 'package:image_picker/image_picker.dart';

class PatientInformation extends StatefulWidget with TextValidators {
  @override
  _PatientInformationState createState() => _PatientInformationState();
}

class _PatientInformationState extends State<PatientInformation> {
  //image picker

  File _image;
  final picker =ImagePicker();
  Future getImage(ImageSource src) async{
    final pickedFile=await picker.getImage(source: src);

    setState(() {
      if(pickedFile !=null){
        _image=File(pickedFile.path);
      }
      else{
        print('No image selected');
      }
    });
  }








  final _formkey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String get _fullName => _fullNameController.text;
  String get _age => _ageController.text;

//focus
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();

  void _fullNameEditingComplete() {
    FocusScope.of(context).requestFocus(_ageFocusNode);
  }

  void _ageEditingComplete() {
    FocusScope.of(context).unfocus();
  }

  void _updateState() {
    setState(() {});
  }

  bool _submitted = false;
  void _submit() {

    setState(() {
      if (_formkey.currentState.validate()) {
        _submitted = true;
        print("successful");
        return;
      } else {
        print("UnSuccessful");
      }
    });
  }

  bool fullNameErrorText;
  bool ageErrorText;

  @override
  Widget build(BuildContext context) {
    bool submitEnable = widget.fullNameValidator.isValid(_fullName) &&
        widget.ageValidator.isValid(_age);
    fullNameErrorText =
        _submitted && !widget.fullNameValidator.isValid(_fullName);
    ageErrorText = _submitted && !widget.ageValidator.isValid(_age);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height:20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Fill Up Patient Information ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    placeholder: "Full Name",
                                    inputType: TextInputType.text,
                                    Controller: _fullNameController,
                                    focusNode: _fullNameFocusNode,
                                    EditingComplete: _fullNameEditingComplete,
                                    errorMsg: fullNameErrorText
                                        ? widget.invalidFullNameErrorText
                                        : null,
                                    validator: (String value) {
                                      if (value.length < 8) {
                                        return 'Full Name can\'t be less than 8 char';
                                      }
                                      return null;
                                    },
                                    actionChanging: (fullName) => _updateState(),
                                  ),
                                  CustomTextField(
                                    placeholder: "Age",
                                    inputType: TextInputType.number,
                                    Controller: _ageController,
                                    focusNode: _ageFocusNode,
                                    EditingComplete: _ageEditingComplete,
                                    errorMsg:
                                        ageErrorText ? widget.invalidAgeErrorText : null,
                                    validator: (String value) {
                                      if (value.length > 3) {
                                        return 'age can\'t be more than 3 numbers ,less than 100';
                                      }
                                      return null;
                                    },
                                    actionChanging: (fullName) => _updateState(),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            text: 'Choose an Image',
                            action:  () async{
                              await getImage(ImageSource.gallery);
                            },
                            icon: Icons.upload_sharp,
                            borderColor: SecondaryTextColor,
                            textColor: Colors.black,
                            bgColor: Colors.white,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            text: 'See Result',
                            action: submitEnable ? _submit : null,
                            icon: Icons.keyboard_arrow_down_sharp,
                            borderColor: SecondaryTextColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          (_image != null)
                              ? Center(
                            child: SingleChildScrollView(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    //deal with this name
                                    _image,
                                    height: 250,
                                    width: 250,
                                    fit: BoxFit.fill,
                                  ),
                              ),
                            ),
                          ):Text(""),
                          SizedBox(
                            height: 20,
                          ),
                          //the result of Glaucoma come from button result
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                                  height:50,
                                  color: Danger,
                                  child:ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Text("Glaucoma Positive",textAlign: TextAlign.center,style: TextStyle(color: DarkDanger,fontWeight: FontWeight.bold,fontSize: 16,),)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
