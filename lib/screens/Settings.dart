import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insurego_gfg/screens/about_first.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color.fromRGBO(221, 161, 7,1)
              ]
          )
      ),
      child: Scaffold(
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
                            child: Image(
                              image: Image.asset('assets/icons/goback.png').image,
                              height: 20.0,
                              width: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Settings",
                    style: TextStyle(
                      color: Color(0xff1f1d1d),
                      fontSize: 28,
                      fontFamily: "lato",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50,),

                Container(
                    width: width,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: const Color(0xffc54f0d)),
                      onPressed: () {
                        //   reg.register(context);
                      },
                      child: Container(
                        width: width,
                        child: const Text(
                          "Update App",
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
                SizedBox(height: 30,),
                Container(
                    width: width,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary:  Color(0xffc54f0d)),
                      onPressed: () {
                        _showLogoutAlert();

                      },
                      child: Container(
                        width: width,
                        child: const Text(
                          "SignOut",
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
              ],
            ),
          ),
        ),
      ),

    );
  }
  void _showLogoutAlert() {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromBottom,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      descStyle: const TextStyle(fontFamily: "regular", fontSize: 14),
      descTextAlign: TextAlign.start,
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: const TextStyle(
          color: Colors.black, fontFamily: "medium", fontSize: 16),
      alertAlignment: Alignment.center,
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      Alert(
        context: context,
        style: alertStyle,
        title: "NepApp!!",
        desc: "Are you sure ?",
        buttons: [
          DialogButton(
            border: const Border.fromBorderSide(
                BorderSide(color: Colors.black, width: 1)),
            color: Colors.transparent,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            width: 120,
            child: const Text(
              "Cancel",
              style: TextStyle(
                  color: Colors.black, fontSize: 16, fontFamily: "lato"),
            ),
          ),
          DialogButton(
            color: Colors.transparent,
            border: const Border.fromBorderSide(
                BorderSide(color: Colors.red, width: 1)),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();

              // final profile = Provider.of<UserProvider>(context);
              //  profile.profileStatus(false);

              SharedPreferences prefs = await SharedPreferences.getInstance();

              prefs.clear().then((value) {
                if (value) {
                  Future.delayed(const Duration(milliseconds: 800), () {
                    Navigator.of(context).pushAndRemoveUntil(
                      // the new route
                      MaterialPageRoute(
                        builder: (BuildContext context) => const About(),
                      ),

                      // this function should return true when we're done removing routes
                      // but because we want to remove all other screens, we make it
                      // always return false
                          (Route route) => false,
                    );
                  });
                }
              });
            },
            width: 120,
            child: const Text(
              "LOGOUT",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontFamily: "medium"),
            ),
          )
        ],
      ).show();
    });
  }
}

//Container(
//               padding: const EdgeInsets.only(right: 20, left: 20),
//               height: 60,
//               color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Image(
//                           image: Image.asset('assets/icons/goback.png').image,
//                           height: 20.0,
//                           width: 20.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               padding: const EdgeInsets.only(
//                 left: 20,
//               ),
//               alignment: Alignment.centerLeft,
//               child: const Text(
//                 "Enter OTP",
//                 style: TextStyle(
//                   color: Color(0xff1f1d1d),
//                   fontSize: 28,
//                   fontFamily: "Playfair Display",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),