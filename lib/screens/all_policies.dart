import 'package:flutter/material.dart';
import 'package:insurego_gfg/provider/insurance_provider.dart';
import 'package:insurego_gfg/provider/register_provider.dart';
import 'package:insurego_gfg/screens/policy_buy_registration.dart';
import 'package:provider/provider.dart';
import 'package:insurego_gfg/models/insurance_model.dart';





class InsurancePolicyListScreen extends StatefulWidget {
  const InsurancePolicyListScreen({Key? key}) : super(key: key);

  @override
  State<InsurancePolicyListScreen> createState() => _InsurancePolicyListScreenState();
}

class _InsurancePolicyListScreenState extends State<InsurancePolicyListScreen> with SingleTickerProviderStateMixin {
  var _isLoading = false;



  static var _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<InsurancePolicyProvider>(context, listen: false).fetchPolicies();

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
    final insurancePolicyProvider = Provider.of<InsurancePolicyProvider>(context);
    final policies = insurancePolicyProvider.policies;
    final reg = Provider.of<RegisterProvider>(context);



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
                  Text("Select Policy",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),

                  policies.length==0?
                Text("No Policy"):

                     ListView.builder(
                       shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: policies.length,
                      itemBuilder: (context, index) {

        final policy = policies[index];
                        return GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PolicyRegistration()));
                          reg.updatepolicyid(insurancePolicyProvider.policies[index].policyName,context);

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
                                          policy.companyName,
                                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text("Claim Ratio - "+
                                          policy.claimSuccessPercentage,
                                          style: const TextStyle(fontSize: 17, color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text("Avg Monthly cost - "+
                                          policy.monthlyCost,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Ploicy Type - "+
                                          policy.type,
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



