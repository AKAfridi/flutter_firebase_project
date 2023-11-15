import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/UI/LogInScreen.dart';
import 'package:flutter_firebase/Utils/utilities.dart';
import '../../Widgets/Button.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: const Text('SignUp')),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        } else {
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                )),
            const SizedBox(
              height: 50,
            ),
            Button_Round(
                loading: loading,
                title: 'SignUp',
                OnTap: () {
                  if (_formkey.currentState!.validate()) {
                    login();
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Already have an account."),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen()));
                    },
                    child: Text(
                      'LogIn.',
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
