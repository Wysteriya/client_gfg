
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/register_provider.dart';

class ClaimRegistration extends StatefulWidget {
  const ClaimRegistration({Key? key}) : super(key: key);

  @override
  State<ClaimRegistration> createState() => _ClaimRegistrationState();
}

class _ClaimRegistrationState extends State<ClaimRegistration>
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
      //Provider.of<Profile>(context, listen: false).getProfile();

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
                            "Claim ",
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
                                    void _showDialog(BuildContext context) {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: const Text('Insurego!'),
                                          content: Text("Claim Succesfully filed"),
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

                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                    Navigator.pop(context);
                                    _showDialog(context);

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
}
//userID

