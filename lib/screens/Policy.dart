import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:insurego_gfg/provider/insurancetype_provider.dart';
import 'package:insurego_gfg/screens/all_policies.dart';

import 'package:provider/provider.dart';
import 'dart:io';



class Policy extends StatefulWidget {
  const Policy({Key? key}) : super(key: key);

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> with SingleTickerProviderStateMixin{
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
    var data = Provider.of<ITypeProvider>(context);


    List<int> semester = [1,2,3];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body:  Padding(padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(
                height: 20,
              ),
              Text("Select Policy Type",style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),


              GridView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: data.TypeItems.length,
                padding: const EdgeInsets.all(5),
                itemBuilder: (BuildContext context, int i) =>
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InsurancePolicyListScreen()));


                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle),
                            padding: const EdgeInsets.only(
                              right: 10,
                              left: 10,
                            ),
                            child: Column(children: [
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: width * 0.15,
                                  backgroundImage: NetworkImage(
                                      data.TypeItems[i].profile_pic_filename[0])),
                              Text(
                                data.TypeItems[i].title,
                                style: const TextStyle(
                                  color: Color(0xff1f1d1d),
                                  fontSize: 21,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5,),

                            ])),
                      ),
                    ),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
              )


          ]
          ),
        ),
      ),

      );  }
}

