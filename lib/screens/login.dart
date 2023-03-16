import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insurego_gfg/provider/auth_provider.dart';
import 'package:insurego_gfg/provider/insurancetype_provider.dart';
import 'package:insurego_gfg/provider/register_provider.dart';
import 'package:insurego_gfg/provider/user_provider.dart';
import 'package:insurego_gfg/screens/main_class.dart';
import 'package:provider/provider.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    //     var data = Provider.of<Onboarding>(context);
    var auth = Provider.of<AuthProvider>(context);




    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Colors.white,  Color.fromRGBO(0, 13, 48, 1),])
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
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: "lato",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ]),




                const SizedBox(
                  height: 30,
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
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 40,
                ),
                Container(
                    width: width,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        //auth.Login(context);
                       // data.UserData(context);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
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
                Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Center(
                      child: Container(
                        child: Image(
                          image: Image.asset('assets/isg.png').image,
                          height: height/4,
                          width: width,
                          fit: BoxFit.contain,
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
}
