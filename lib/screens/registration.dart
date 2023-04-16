import 'dart:convert';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:insurego_gfg/provider/register_provider.dart';
import 'package:insurego_gfg/utils/colorConstants.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static var _isInit = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  List<String> gender = ["Select Gender", "Male", "Female", "Others"];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
     // Provider.of<RegisterProvider>(context, listen: false).getCity();
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
    var reg = Provider.of<RegisterProvider>(context);
    //     var data = Provider.of<Onboarding>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));

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
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  height: 60,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: Colors.white,


                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: "Playfair Display",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ]),
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

                        hintText: "Name",

                        //make hint text
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(248, 173, 13, 1),
                          fontSize: 16,
                          fontFamily: "lato",
                          fontWeight: FontWeight.w400,
                        ),

                        //create lable
                        labelText: 'Name',
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
                      obscureText: true,
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


                        hintText: "Password",

                        //make hint text
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(248, 173, 13, 1),
                          fontSize: 16,
                          fontFamily: "lato",
                          fontWeight: FontWeight.w400,
                        ),

                        //create lable
                        labelText: 'Password',
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
                    height: 40,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 1, color: Color.fromRGBO(248, 173, 13, 1)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        buttonPadding: const EdgeInsets.only(left: 8, right: 8),
                        alignment: AlignmentDirectional.centerStart,
                        //   borderRadius: BorderRadius.circular(12),
                        //   color: ConstantColors.mainColor,
                        // ),
                        buttonHeight: 20,
                        buttonWidth: 60,
                        itemHeight: 35,
                        dropdownMaxHeight: height * 0.60,
                        value: reg.gender,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.black),
                        onChanged: (newValue) {
                          reg.updateGender(newValue!);
                        },
                        items: gender.map((String value) {
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


                        hintText: "State",

                        //make hint text
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(248, 173, 13, 1),
                          fontSize: 16,
                          fontFamily: "lato",
                          fontWeight: FontWeight.w400,
                        ),

                        //create lable
                        labelText: 'State',
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


                        hintText: "City",

                        //make hint text
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(248, 173, 13, 1),
                          fontSize: 16,
                          fontFamily: "lato",
                          fontWeight: FontWeight.w400,
                        ),

                        //create lable
                        labelText: 'City',
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

                Container(
                    width: width,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () async{
                       reg.register(context);



                      },
                      child: Container(
                        width: width,
                        child: const Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ))),
    );
  }
}


