import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:riceservice/controller/CountController.dart';
import 'package:riceservice/screen/components/app_main.dart';
import 'package:riceservice/screen/components/button_without_label.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

import '../../controller/CredentialsController.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 620,
        margin: const EdgeInsets.symmetric(horizontal:16),
        padding: const EdgeInsets.symmetric(vertical:32,horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.all(Radius.circular(40)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
                children: [
                  const Text("Sign In",style: TextStyle(
                    fontSize: 34, fontFamily: "Poppins",
                  )),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical:16),
                    child: Text("One product of Kien Pham",textAlign: TextAlign.center),
                  ),

                  SignInForm(),
                  Row(children:const [
                    Expanded(child: Divider()),
                    Padding(padding: EdgeInsets.symmetric(
                        horizontal: 16
                    ),
                        child: Text("OR",style: TextStyle(
                          color: Colors.black26,
                        ))
                    ),
                    Expanded(child:Divider()),
                  ]
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical:20),
                    child: Text("Sign up with Email, Apple or Facebook",style: TextStyle()),
                  ),
                  Row(
                      children:[
                        const Spacer(),
                        ButtonWithoutLabel(icon: Icons.email,onpressed: (){},iconColor: Colors.blue,),
                        const Spacer(),
                        ButtonWithoutLabel(icon: Icons.apple,onpressed: (){},iconColor: Colors.blue,),
                        const Spacer(),
                        ButtonWithoutLabel(icon: Icons.facebook,onpressed: (){},iconColor: Colors.blue,),
                        const Spacer(),
                      ]
                  )
                ]
            ),
          ),
        )
    );
  }
}


class SignInForm extends StatelessWidget {
  SignInForm({Key? key,}) : super(key: key);
  final CredentialsController credentials = Get.put(CredentialsController());
  void doSignIn() {
    print("singin");
    credentials.login();
  }
  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email",style: TextStyle(color: Colors.black54)),
        Padding(
          padding: const EdgeInsets.only(top:8,bottom:16),
          child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Padding(padding:  EdgeInsets.symmetric(horizontal: 8),child: Icon(Icons.email)),
              ) ),
        ),

        const Text("Password",style: TextStyle(color: Colors.black54)),
        Padding(
          padding: const EdgeInsets.only(top:8,bottom:16),
          child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  prefixIcon: Padding(padding:  EdgeInsets.symmetric(horizontal: 8),child: Icon(Icons.key))
              ) ),
        ),

        Padding(
          padding: const EdgeInsets.only(top:8.0,bottom:24),
          child: ElevatedButton.icon(
              onPressed: (){

                doSignIn();
                Get.back();
                Get.offAll(const SecureApp());

              },
              icon: const Icon(CupertinoIcons.arrow_right),
              label: const Text("Sign In"),
              style: ElevatedButton.styleFrom(
                  primary: TWColors.purple.shade700,
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
              )
          ),
        ),

      ],
    ));
  }


}


class TestLogin extends StatelessWidget {
  TestLogin({Key? key}) : super(key: key);
  final CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Obx(
                    () => Text("Click: ${countController.count}")
            )
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              countController.increment();
            },child: const Icon(Icons.add))
    );
  }
}




class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var credentials = Get.put(CredentialsController());
  var isLogin = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void changeScreen(){
    setState(() {
      if(credentials.isLogin == true.obs){
        isLogin = true;
      }else{
        isLogin = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    /*return Container(
        child: Obx((){
          if(isLogin){
            return SecureApp();
          }
          else{

            return Scaffold(
                body: Stack(
                    children: [
                      SafeArea(
                          child: Column(
                              children: [
                                const Text("Rice Server",
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontFamily: "Poppins"
                                    )),
                                ElevatedButton(onPressed: (){
                                  // print("test");
                                  Get.dialog(
                                    transitionDuration: const Duration(milliseconds: 1000),
                                     Center(
                                        child: LoginScreen(changeScreen: changeScreen,)
                                    ),
                                  );// Get.to(TestLogin());

                                }, child: const Text("Login"))
                              ]
                          ))

                    ]
                )

              // This trailing comma makes auto-formatting nicer for build methods.
            );
          }

        }

        ),
      );
*/
    return Scaffold(
        body: Stack(
            children: [
              SafeArea(
                  child: Column(
                      children: [
                        const Text("Rice Server",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: "Poppins"
                            )),
                        ElevatedButton(onPressed: (){
                          // print("test");
                          Get.dialog(
                            transitionDuration: const Duration(milliseconds: 1000),
                            Center(
                                child: LoginScreen()
                            ),
                          );// Get.to(TestLogin());

                        }, child: const Text("Login"))
                      ]
                  ))

            ]
        )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}