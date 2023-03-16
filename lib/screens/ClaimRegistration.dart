import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ClaimRegistration extends StatefulWidget {
  const ClaimRegistration({Key? key}) : super(key: key);

  @override
  State<ClaimRegistration> createState() => _ClaimRegistrationState();
}

class _ClaimRegistrationState extends State<ClaimRegistration>
    with SingleTickerProviderStateMixin {
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
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Color(0xff1f1d1d),
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
                                    //   Provider.of<Profile>(context, listen: false).getProfile();
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
                                        'assets/My Picture.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ]),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'New Name',
                              style: TextStyle(
                                color: Color(0xff1f1d1d),
                                fontSize: 14,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: width,
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: TextFormField(
                                //controller: data.nameController,
                                decoration: const InputDecoration(
                                  fillColor: Color(0xfffffde7),
                                  border: InputBorder.none,
                                  filled: true,
                                ),
                              ),
                            ),
                            const Opacity(
                              opacity: 0.80,
                              child: Text(
                                "New User Type",
                                style: TextStyle(
                                  color: Color(0xff1f1d1d),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  ]),
            ),
          )),
    );
  }
}
