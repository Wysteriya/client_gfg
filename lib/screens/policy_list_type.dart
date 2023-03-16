import 'package:flutter/material.dart';

class Poilicies extends StatefulWidget {
  @override
  _PoiliciesState createState() => _PoiliciesState();
}

class _PoiliciesState extends State<Poilicies> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["Policy Name"],
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      post["Insurer"],
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      post["Settlement%"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ ${post["Add ons"]}",
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["price"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ],
                ),
                Image.network(
                  "${post["image"]}",
                  height: 15,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
              Colors.white,
              Colors.blue,
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: size.height,
            child: Column(
              children: <Widget>[
                Container
                  (padding: EdgeInsets.only(left: 10,top: 10),
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                ),
                // AnimatedOpacity(
                //   duration: const Duration(milliseconds: 200),
                //   opacity: closeTopContainer?0:1,
                //   child: AnimatedContainer(
                //       duration: const Duration(milliseconds: 200),
                //       width: size.width,
                //       alignment: Alignment.topCenter,
                //       height: closeTopContainer?0:categoryHeight,
                //       child: categoriesScroller),
                // ),
                Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: itemsData.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          double scale = 1.0;
                          if (topContainer > 0.5) {
                            scale = index + 0.5 - topContainer;
                            if (scale < 0) {
                              scale = 0;
                            } else if (scale > 1) {
                              scale = 1;
                            }
                          }
                          return Opacity(
                            opacity: scale,
                            child: Transform(
                              transform: Matrix4.identity()
                                ..scale(scale, scale),
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {},
                                child: Align(
                                    heightFactor: 0.8,
                                    alignment: Alignment.topCenter,
                                    child: itemsData[index]),
                              ),
                            ),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const FOOD_DATA = [
  {
    "Policy Name": "Sampoorna Raksha ",
    "Insurer": "Tata AIA",
    "type": "Life",
    "Settlement%": "80",
    "Add ons": "Accidental Death,critical illness",
    "price": "1500/mo",
    "image":
        "https://static.pbcdn.in/term-cdn/images/images/insurer/TATA_AIA_logo.png"
  },
  {
    "Policy Name": "Sampoorna Raksha ",
    "Insurer": "Tata AIA",
    "type": "Life",
    "Settlement%": "80",
    "Add ons": "Accidental Death,critical illness",
    "price": "1500/mo",
    "image":
        "https://static.pbcdn.in/term-cdn/images/images/insurer/TATA_AIA_logo.png"
  },
  {
    "Policy Name": "Sampoorna Raksha ",
    "Insurer": "Tata AIA",
    "type": "Life",
    "Settlement%": "80",
    "Add ons": "Accidental Death,critical illness",
    "price": "1500/mo",
    "image":
        "https://static.pbcdn.in/term-cdn/images/images/insurer/TATA_AIA_logo.png"
  },
  {
    "Policy Name": "Sampoorna Raksha ",
    "Insurer": "Tata AIA",
    "type": "Life",
    "Settlement%": "80",
    "Add ons": "Accidental Death,critical illness",
    "price": "1500/mo",
    "image":
        "https://static.pbcdn.in/term-cdn/images/images/insurer/TATA_AIA_logo.png"
  },
  {
    "Policy Name": "Sampoorna Raksha ",
    "Insurer": "Tata AIA",
    "type": "Life",
    "Settlement%": "80",
    "Add ons": "Accidental Death,critical illness",
    "price": "1500/mo",
    "image":
        "https://static.pbcdn.in/term-cdn/images/images/insurer/TATA_AIA_logo.png"
  },
  {
    "Policy Name": "Sampoorna Raksha ",
    "Insurer": "Tata AIA",
    "type": "Life",
    "Settlement%": "80",
    "Add ons": "Accidental Death,critical illness",
    "price": "1500/mo",
    "image":
        "https://static.pbcdn.in/term-cdn/images/images/insurer/TATA_AIA_logo.png"
  },
  {
    "Policy Name": "Sampoorna Raksha ",
    "Insurer": "Tata AIA",
    "type": "Life",
    "Settlement%": "80",
    "Add ons": "Accidental Death,critical illness",
    "price": "1500/mo",
    "image":
        "https://www.bajajallianzlife.com/content/dam/balic/index/bajaj-logo.png"
  },
];
