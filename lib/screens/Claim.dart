import 'package:flutter/material.dart';
import 'package:insurego_gfg/provider/insurancetype_provider.dart';
import 'package:provider/provider.dart';


class Claim extends StatefulWidget {
  @override
  _ClaimState createState() => _ClaimState();
}

class _ClaimState extends State<Claim> {
  static var _isInit = true;

  int selectedIndex= 0;

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


  final CategoriesScroller categoriesScroller = const CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ ${post["price"]}",
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.network(
                  "${post["image"]}",
                  height: 20,
                  fit: BoxFit.contain,

                )
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

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ITypeProvider>(context);

    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Container(
          height: size.height,
          child: Column(

            children: <Widget>[

              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 30,
                child: ListView.builder(
                  controller: ScrollController(),
                  itemCount: data.TypeItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    value: data.TypeItems[i],
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                              // data.updateSubject(data
                              //     .SubjectItems[selectedIndex].Subjectname);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              gradient: i == selectedIndex
                                  ?   LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xffbbebff), Colors.indigo],
                              )
                                  : LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.white,Colors.black],
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 2,
                            ),
                            child: Text(
                              data.TypeItems[i].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:categoryHeight,
                    child: categoriesScroller),
              ),
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
                            transform:  Matrix4.identity()..scale(scale,scale),
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: (){

                              },
                              child: Align(
                                  heightFactor: 0.7,
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
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.20;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Most\nFavorite",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Newest",
                          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.lightBlueAccent.shade400, borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Super\nSaving",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
const FOOD_DATA = [
  {
    "name":"Bajaj",
    "brand":"Health",
    "price":"Policy no",
    "image":"https://www.bajajallianzlife.com/content/dam/balic/index/bajaj-logo.png"
  },

  {
    "name":"Bajaj",
    "brand":"Health",
    "price":"Policy no",
    "image":"https://www.bajajallianzlife.com/content/dam/balic/index/bajaj-logo.png"
  },
  {
    "name":"Bajaj",
    "brand":"Health",
    "price":"Policy no",
    "image":"https://www.bajajallianzlife.com/content/dam/balic/index/bajaj-logo.png"
  },
  {
    "name":"Bajaj",
    "brand":"Health",
    "price":"Policy no",
    "image":"https://www.bajajallianzlife.com/content/dam/balic/index/bajaj-logo.png"
  },

  {
    "name":"Bajaj",
    "brand":"Health",
    "price":"Policy no",
    "image":"https://www.bajajallianzlife.com/content/dam/balic/index/bajaj-logo.png"
  },
  {
    "name":"Bajaj",
    "brand":"Health",
    "price":"Policy no",
    "image":"https://www.bajajallianzlife.com/content/dam/balic/index/bajaj-logo.png"
  },
  {
    "name":"Bajaj",
    "brand":"Health",
    "price":"Policy no",
    "image":"https://www.bajajallianzlife.com/content/dam/balic/index/bajaj-logo.png"
  },

  {
    "name":"Bajaj",
    "brand":"Health",
    "price":"Policy no",
    "image":"https://www.bajajallianzlife.com/content/dam/balic/index/bajaj-logo.png"
  },
  {
    "name":"Bajaj",
    "brand":"Health",
    "price":"Policy no",
    "image":"https://www.bajajallianzlife.com/content/dam/balic/index/bajaj-logo.png"
  },
];
//buy 4 types of policy reg screen
// list of all available policies
//claims reg screen