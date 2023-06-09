import 'package:flutter/material.dart';
import 'package:insurego_gfg/provider/insurance_provider.dart';
import 'package:insurego_gfg/provider/register_provider.dart';
import 'package:insurego_gfg/screens/policy_buy_registration.dart';
import 'package:provider/provider.dart';
import 'package:insurego_gfg/models/insurance_model.dart';





class Claim extends StatefulWidget {
  const Claim({Key? key}) : super(key: key);

  @override
  State<Claim> createState() => _ClaimState();
}

class _ClaimState extends State<Claim> with SingleTickerProviderStateMixin {
  var _isLoading = false;



  static var _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<RegisterProvider>(context, listen: false).UserStatus(context);

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
    final reg = Provider.of<RegisterProvider>(context);
setState(() {
  reg.UserStatus(context);

});

    return Container(decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Colors.white, Colors.blue])),
      child: Scaffold(backgroundColor: Colors.transparent,
          body:  SafeArea(
            child: SingleChildScrollView(
              child: Column(

                  children: [
                    SizedBox(height: 20,),

                    reg.insurances.length==0?
                    Text("No Policy"):

                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: reg.insurances.length,
                      itemBuilder: (context, index) {

                        return GestureDetector(onTap: (){


                        },
                          child: Container(
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
                                        // Text(
                                        //   policy.policyName,
                                        //   style: const TextStyle(
                                        //       fontSize: 14, fontWeight: FontWeight.bold),
                                        //   overflow: TextOverflow.fade,
                                        // ),
                                        Text("Comapny - "+
                                            reg.insurances[index].companyName,
                                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text("Claim Ratio - "+
                                            reg.insurances[index].claimSuccessPercentage,
                                          style: const TextStyle(fontSize: 17, color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text("Avg Monthly cost - "+
                                            reg.insurances[index].monthlyCost,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Ploicy Type - "+
                                            reg.insurances[index].type,
                                          style: const TextStyle(fontSize: 17, color: Colors.grey),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              )
                          ),
                        );
                      },
                    ),
                  ]  ),
            ),
          )
      ),
    );
  }
}
