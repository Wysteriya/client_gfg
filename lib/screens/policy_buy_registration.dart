import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurego_gfg/provider/insurance_provider.dart';
import 'package:insurego_gfg/screens/main_class.dart';
import 'package:provider/provider.dart';

import '../provider/register_provider.dart';

class PolicyRegistration extends StatefulWidget {
  const PolicyRegistration({Key? key}) : super(key: key);

  @override
  State<PolicyRegistration> createState() => _PolicyRegistrationState();
}

class _PolicyRegistrationState extends State<PolicyRegistration>
    with SingleTickerProviderStateMixin {
  bool value = false;
  bool smoker = false;
  bool alcholoh = false;
  bool tobacoo = false;





  static var _isInit = true;
  final ImagePicker _picker = ImagePicker();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
     // Provider.of<InsuranceProvider>(context, listen: false).fetchInsurances();

      setState(() {
        _isInit = false;
      });
    }
  }

  @override
  void dispose() {
    setState(() {
      _isInit = true;
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> ageList = List.generate(91, (index) => "${index + 10}");
    List<String> amountList = List.generate(28, (index) {
      double amount = 5000000.0 + (index * 2500000.0);
      if (amount < 10000000.0) {
        return "${amount / 100000.0} lakh";
      } else {
        return "${amount / 10000000.0} cr";
      }
    });
    List<String> payfor = List.generate(76, (index) => "${index + 5}");

    List<String> mode = ["Monthly","Quaterly","Half","Yearly"];




    var reg = Provider.of<RegisterProvider>(context);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int index = 0;
    //var data = Provider.of<Profile>(context);
    List<String> type = ["Teacher", "Staff"];

    _settingModalBottomSheet(String type) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SizedBox(
              height: 150,
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.camera),
                      title: const Text('Camera'),
                      onTap: () async {
                        Navigator.pop(context);
                        final pickedFile = await _picker.pickImage(
                            source: ImageSource.camera,
                            maxHeight: 500,
                            maxWidth: 500,
                            imageQuality: 50);

                        //    await data.uploadProfileImage(type, pickedFile!.path);
                      }),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Gallery'),
                    onTap: () async {
                      Navigator.pop(context);
                      final pickedFile = await _picker.pickImage(
                          source: ImageSource.gallery,
                          maxHeight: 500,
                          maxWidth: 500,
                          imageQuality: 50);

                      //    await data.uploadProfileImage(type, pickedFile!.path);
                    },
                  ),
                ],
              ),
            );
          });
    }

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
            Colors.white,
            Color.fromRGBO(0, 13, 48, 1),
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Buy Policy",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  onPressed: () {
                                    //data.editProfile(context);
                                    Navigator.pop(context);
                                    _showDialog("Policy Succesfully Bought",context);
                                  },
                                  child: const Text(
                                    "Confirm",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xfff6e80b),
                                      fontSize: 12,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Upload Documents",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                          height: 100,
                          width: 115,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _settingModalBottomSheet("profile");
                                },
                                child: Container(
                                  height: height * 0.40,
                                  width: width,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/upload_icon.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ]),
                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ), //SizedBox
                        const Text(
                          'Alcoholic',
                          style: TextStyle(fontSize: 14.0,color: Colors.yellow),
                        ), //Text
                        const SizedBox(width: 5), //SizedBox
                        Checkbox(
                          value: this.alcholoh,
                          onChanged: (bool? value) {
                            setState(() {
                              this.alcholoh = value!;
                            });
                          },
                        ),

                        const SizedBox(
                          width: 10,
                        ), //SizedBox
                        const Text(
                          'Smoker',
                          style: TextStyle(fontSize: 14.0,color: Colors.yellow),
                        ), //Text
                        const SizedBox(width: 5), //SizedBox
                        Checkbox(
                          value: this.smoker,
                          onChanged: (bool? value) {
                            setState(() {
                              this.smoker = value!;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Tobacoo',
                          style: TextStyle(fontSize: 14.0,color: Colors.yellow),
                        ), //Text
                        const SizedBox(width: 5), //SizedBox
                        Checkbox(
                          checkColor: Colors.white,

                          value: this.tobacoo,
                          onChanged: (bool? value) {
                            setState(() {
                              this.tobacoo = value!;
                            });
                          },
                        ),

                        const SizedBox(
                          width: 10,
                        ),




                      ], //<Widget>[]
                    ),
                    SizedBox(height: 20,),
                    Padding(padding: EdgeInsets.all(0),
                      child: Row(
                        children: [
                          SizedBox(width: 5,),

                          Text("Cover", style: TextStyle(fontSize: 14.0,color: Colors.yellow),
                          ),
                          SizedBox(width: 10,),

                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Container(
                              height: 40,
                              width: width*0.30,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    width: 1,
                                    color: const Color.fromRGBO(248, 173, 13, 1)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  buttonPadding:
                                  const EdgeInsets.only(left: 8, right: 8),
                                  alignment: AlignmentDirectional.centerStart,
                                  //   borderRadius: BorderRadius.circular(12),
                                  //   color: ConstantColors.mainColor,
                                  // ),
                                  buttonHeight: 20,
                                  buttonWidth: 60,
                                  itemHeight: 35,
                                  dropdownMaxHeight: height * 0.60,
                                  value: amountList.first,
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                                  onChanged: (newValue) {
                                    //  reg.updateGender(newValue!);
                                  },
                                  items: amountList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(value,
                                              style: const TextStyle(
                                                fontFamily: "lato",
                                                color: Colors.black,
                                                fontSize: 17,
                                              ))
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("Cover Till Yr", style: TextStyle(fontSize: 14.0,color: Colors.yellow),
                          ),
                          Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 40,
                            width: width*0.25,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 1,
                                  color: const Color.fromRGBO(248, 173, 13, 1)),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                buttonPadding:
                                const EdgeInsets.only(left: 8, right: 8),
                                alignment: AlignmentDirectional.centerStart,
                                //   borderRadius: BorderRadius.circular(12),
                                //   color: ConstantColors.mainColor,
                                // ),
                                buttonHeight: 20,
                                buttonWidth: 60,
                                itemHeight: 35,
                                dropdownMaxHeight: height * 0.60,
                                value: ageList.first,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                                onChanged: (newValue) {
                                //  reg.updateGender(newValue!);
                                },
                                items: ageList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(value,
                                            style: const TextStyle(
                                              fontFamily: "lato",
                                              color: Colors.black,
                                              fontSize: 17,
                                            ))
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
        ]
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(padding: EdgeInsets.all(0),
                      child: Row(
                          children: [
                            SizedBox(width: 5,),

                            Text("Mode", style: TextStyle(fontSize: 14.0,color: Colors.yellow),
                            ),
                            SizedBox(width: 10,),

                            Padding(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                height: 40,
                                width: width*0.30,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromRGBO(248, 173, 13, 1)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    buttonPadding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                    alignment: AlignmentDirectional.centerStart,
                                    //   borderRadius: BorderRadius.circular(12),
                                    //   color: ConstantColors.mainColor,
                                    // ),
                                    buttonHeight: 20,
                                    buttonWidth: 60,
                                    itemHeight: 35,
                                    dropdownMaxHeight: height * 0.60,
                                    value: mode.first,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: Colors.black),
                                    onChanged: (newValue) {
                                      //  reg.updateGender(newValue!);
                                    },
                                    items: mode.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(value,
                                                style: const TextStyle(
                                                  fontFamily: "lato",
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                ))
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text("Pay for Yr", style: TextStyle(fontSize: 14.0,color: Colors.yellow),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 40,
                                width: width*0.25,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromRGBO(248, 173, 13, 1)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    buttonPadding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                    alignment: AlignmentDirectional.centerStart,
                                    //   borderRadius: BorderRadius.circular(12),
                                    //   color: ConstantColors.mainColor,
                                    // ),
                                    buttonHeight: 20,
                                    buttonWidth: 60,
                                    itemHeight: 35,
                                    dropdownMaxHeight: height * 0.60,
                                    value: payfor.first,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: Colors.black),
                                    onChanged: (newValue) {
                                      //  reg.updateGender(newValue!);
                                    },
                                    items: payfor.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(value,
                                                style: const TextStyle(
                                                  fontFamily: "lato",
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                ))
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Name",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Full Name As per ID proof',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: reg.nameError,
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "*Name is Invalid.",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Email",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Email',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: reg.emailError,
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "*Email is Invalid.",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Occupation",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Occupation',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: reg.passwordError,
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "*Password is Invalid.",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),



                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Annual Income",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Annual Income',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Education",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Education',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Aadhar No",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Aadhar No',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Pan No",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Pan No',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),


                    const SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          )),
    );
  }
  void _showDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Insurego!'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size.fromHeight(40.0)),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            child: const Text('Okay'),
            onPressed: () {

              Navigator.of(ctx).pop();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));

            },
          )
        ],
      ),
    );
  }
}
