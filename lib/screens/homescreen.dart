import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insurego_gfg/provider/insurancetype_provider.dart';
import 'package:insurego_gfg/provider/user_provider.dart';
import 'package:insurego_gfg/screens/ClaimRegistration.dart';
import 'package:insurego_gfg/screens/Track_Claim.dart';
import 'package:insurego_gfg/screens/policy_buy_registration.dart';
import 'package:insurego_gfg/screens/policy_list_type.dart';
import 'package:insurego_gfg/screens/top_polices.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static var _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<ITypeProvider>(context, listen: false).getInsuranceTypes();

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
    var data = Provider.of<UserProvider>(context);
    var ele = Provider.of<ITypeProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Colors.white, Colors.blue])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Hello Username,",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "lato",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: data.UserItems.length,
                    itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                      // builder: (c) => products[i],
                      value: data.UserItems[i],
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          width: width,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Basic Information.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "lato",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: width,
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Color(0x99dda107),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Matriculation No.${data.UserItems[i].emailAddress}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: "lato",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Full Name         ${data.UserItems[i].name}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: "lato",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Faculty         ${data.UserItems[i].stream}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: "lato",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Major         ${data.UserItems[i].branch}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: "lato",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Current Semester         ${data.UserItems[i].semester}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: "lato",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(padding: EdgeInsets.only(top: 10,left: 10),
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19343c44),
                          blurRadius: 16,
                          offset: Offset(0, 8),
                        ),
                        BoxShadow(
                          color: Color(0x0a75838e),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Color.fromRGBO(0, 13, 48, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(child: Text(
                          "Fill out your details & \n get insured faster!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: 96,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color.fromRGBO(255,255,255,1),
                                ),
                                child:Text(
                                  "Add Now",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    letterSpacing: 0.50,
                                  ),
                                )
                            ),
                            Image(height: 100,image: Image.asset("assets/complete.png").image),
                          ],
                        )
                      ],
                    ),

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2,
                      viewportFraction: 0.5,
                      initialPage: 0,
                    ),
                    items: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Attendance()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: width * 0.80,
                          height: 86,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x66000000),
                                blurRadius: 15,
                                offset: Offset(0, 8),
                              ),
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffbbebff), Colors.indigo],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Track Your Claim",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Chillax",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 49,
                                height: 49,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 49,
                                      height: 49,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2.45,
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 9.80,
                                          height: 15.87,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: Image.asset(
                                                          "assets/icons/arrow.png")
                                                      .image)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Marks()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: width * 0.80,
                          height: 86,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x66000000),
                                blurRadius: 15,
                                offset: Offset(0, 8),
                              ),
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffbbebff), Colors.indigo],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Top Policies",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Chillax",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 49,
                                height: 49,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 49,
                                      height: 49,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2.45,
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 9.80,
                                          height: 15.87,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: Image.asset(
                                                          "assets/icons/arrow.png")
                                                      .image)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: width * 0.80,
                        height: 86,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x66000000),
                              blurRadius: 15,
                              offset: Offset(0, 8),
                            ),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xffbbebff), Colors.indigo],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Premium Calculator",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Chillax",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 49,
                              height: 49,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 49,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.45,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 9.80,
                                        height: 15.87,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: Image.asset(
                                                        "assets/icons/arrow.png")
                                                    .image)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: width * 0.80,
                        height: 86,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x66000000),
                              blurRadius: 15,
                              offset: Offset(0, 8),
                            ),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xffbbebff), Colors.indigo],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Policy Advisor",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Chillax",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 49,
                              height: 49,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 49,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.45,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 9.80,
                                        height: 15.87,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: Image.asset(
                                                        "assets/icons/arrow.png")
                                                    .image)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(padding: EdgeInsets.only(top: 10,left: 10),
                      width: width,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19343c44),
                            blurRadius: 16,
                            offset: Offset(0, 8),
                          ),
                          BoxShadow(
                            color: Color(0x0a75838e),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: Colors.deepPurple,
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(child: Text(
                    "Contact our experts\nto get best policy advice in our community",
                    style: TextStyle(
                        color: Color(0xff000d30),
                    fontSize: 14,
                  ),
            ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 96,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff000d30),
                              ),
                              child:Text(
                                "Join Us",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  letterSpacing: 0.50,
                                ),
                              )
                            ),
                            Image(height: 100,image: Image.asset("assets/policyadvice_contactus.png").image),
                          ],
                        )
                      ],
                    ),

                  ),
                  ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ClaimRegistration()));}, child: Text("Claim Registration")),
                  ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Poilicies()));}, child: Text("List of policies")),
                  ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PolicyRegistration()));}, child: Text("Policy registration")),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
