
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insurego_gfg/provider/auth_provider.dart';
import 'package:insurego_gfg/provider/insurance_provider.dart';
import 'package:insurego_gfg/provider/insurancetype_provider.dart';
import 'package:insurego_gfg/provider/register_provider.dart';
import 'package:insurego_gfg/screens/about_first.dart';
import 'package:insurego_gfg/screens/main_class.dart';
import 'package:insurego_gfg/screens/slider.dart';
import 'package:insurego_gfg/screens/splash.dart';
import 'package:provider/provider.dart';



class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return MultiProvider(
      providers: [

        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: RegisterProvider('',''),
        ),

        ChangeNotifierProxyProvider<AuthProvider, ITypeProvider>(
          create: (ctx) => ITypeProvider(),
          update: (ctx,auth,_) => ITypeProvider(),
        ),

        ChangeNotifierProxyProvider<AuthProvider, RegisterProvider>(
                  create: (ctx) => RegisterProvider('',''),
                   update: (ctx,auth,_) => RegisterProvider('',''),
                 ),
        ChangeNotifierProxyProvider<AuthProvider, InsuranceProvider>(
          create: (ctx) => InsuranceProvider(),
          update: (ctx,auth,_) => InsuranceProvider(),
        ),

        ChangeNotifierProxyProvider<AuthProvider, InsurancePolicyProvider>(
          create: (ctx) => InsurancePolicyProvider(),
          update: (ctx,auth,_) => InsurancePolicyProvider(),
        ),

      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              brightness: Brightness.light,
              fontFamily: 'medium',
            ),
            home: auth.isAuth
                ? const MainScreen()
                : FutureBuilder(
                  //  future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting ? const SplashScreen() :  slider(),
                  ),
            //routes: {
          //               Login.routeName:(context)=>Login(),
          //             About.routeName: (context) => const About(),
          //
          //             }
           ),
      ),
    );
  }
}
