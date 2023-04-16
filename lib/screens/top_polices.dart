import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class Marks extends StatefulWidget {
  const Marks({Key? key}) : super(key: key);

  @override
  State<Marks> createState() => _MarksState();
}

class _MarksState extends State<Marks> with SingleTickerProviderStateMixin {
  static var _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
     // Provider.of<UserProvider>(context, listen: false).AllMarks();

      setState(() {
        _isInit = false;
      });
    }
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //var data = Provider.of<UserProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Color.fromRGBO(221, 161, 7, 1)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: const EdgeInsets.all(20),
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
                              image:
                                  Image.asset('assets/icons/goback.png').image,
                              height: 20.0,
                              width: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.only(left: 20),
                //   height: 30,
                //   child: ListView.builder(
                //     controller: ScrollController(),
                //     itemCount: data.SubjectItems.length,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                //       value: data.SubjectItems[i],
                //       child: Row(
                //         children: [
                //           InkWell(
                //             onTap: () {
                //               setState(() {
                //                 selectedIndex = i;
                //                 data.updateSubject(data
                //                     .SubjectItems[selectedIndex].Subjectname);
                //               });
                //             },
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(11),
                //                 color: i == selectedIndex
                //                     ? const Color.fromRGBO(31, 31, 29, 1)
                //                     : Colors.grey,
                //               ),
                //               padding: const EdgeInsets.symmetric(
                //                 horizontal: 12,
                //                 vertical: 2,
                //               ),
                //               child: Text(
                //                 data.SubjectItems[i].Subjectname,
                //                 style: const TextStyle(
                //                   color: Color.fromRGBO(246, 232, 11, 1),
                //                   fontSize: 16,
                //                   fontFamily: "Lato",
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                //   controller: ScrollController(),
                //   itemCount: data.MarksItems.length,
                //   itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                //     // builder: (c) => products[i],
                //     value: data.MarksItems[i],
                //     child: Container(
                //         decoration: const BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.all(Radius.circular(20)),
                //         ),
                //         width: width,
                //         child: Container(
                //           decoration: const BoxDecoration(
                //             borderRadius: BorderRadius.all(Radius.circular(20)),
                //           ),
                //           padding: const EdgeInsets.only(
                //               left: 10, bottom: 10, right: 10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               const SizedBox(
                //                 height: 20,
                //               ),
                //               const Text(
                //                 "Report Card.",
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontSize: 18,
                //                   fontFamily: "lato",
                //                   fontWeight: FontWeight.w700,
                //                 ),
                //               ),
                //               const SizedBox(
                //                 height: 30,
                //               ),
                //               Container(
                //                 width: width,
                //                 padding: const EdgeInsets.all(10),
                //                 decoration: const BoxDecoration(
                //                   color: Color(0x99dda107),
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(20)),
                //                 ),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   children: [
                //                     Container(
                //                       child: Text(
                //                         "Internal Assessment:${data.MarksItems[i].ia}",
                //                         style: const TextStyle(
                //                           color: Colors.black,
                //                           fontSize: 16,
                //                           fontFamily: "lato",
                //                           fontWeight: FontWeight.w500,
                //                         ),
                //                       ),
                //                     ),
                //                     const SizedBox(
                //                       height: 5,
                //                     ),
                //                     Container(
                //                       child: Text(
                //                         "Semester End Marks:        ${data.MarksItems[i].see}",
                //                         style: const TextStyle(
                //                           color: Colors.black,
                //                           fontSize: 16,
                //                           fontFamily: "lato",
                //                           fontWeight: FontWeight.w500,
                //                         ),
                //                       ),
                //                     ),
                //                     const SizedBox(
                //                       height: 5,
                //                     ),
                //                     Container(
                //                       child: Text(
                //                         "Subject:         ${data.MarksItems[i].subject}",
                //                         style: const TextStyle(
                //                           color: Colors.black,
                //                           fontSize: 16,
                //                           fontFamily: "lato",
                //                           fontWeight: FontWeight.w500,
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               )
                //             ],
                //           ),
                //         )),
                //   ),
                // ),
              ],
            )),
      ),
    );
  }
}
