import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/UI/auth/signUp.dart';
import 'package:flutter_firebase/Widgets/Button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      SystemNavigator.pop();
      return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(child: const Text('LogIn')),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Enter Your Email",
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Email';
                          }
                          else{
                            return null;
                          }
                        },
                      ),

                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: "Enter Password",
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Password';
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 50,
              ),
              Button_Round(title: 'LogIN', OnTap: () {
                if(_formkey.currentState!.validate()){
                }
              }),
              Row(mainAxisAlignment:MainAxisAlignment.end,
              children: [

                Text("Don't have an account."),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));

                }, child: Text('SignUp.',))
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
