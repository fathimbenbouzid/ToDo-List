import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(
                height: 250,
              ),
              TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.2)),
                    label: const Text("Enter EmailAdrres"),
                    hintText: "Example : john@gmail.com"),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: _passwordcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.2)),
                    label: const Text("Enter Password"),
                    hintText: "**********"),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _emailcontroller.text.trim(),
                        password: _emailcontroller.text.trim(),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        debugPrint(
                            '==================================The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        debugPrint(
                            '==================================The account already exists for that email.');
                      }
                    } catch (e) {
                      debugPrint(
                          "=================================== ${e.toString()}");
                    }
                  },
                  child: const Text("SignUp"),
                ),
              )
            ],
          ),
        ));
  }
}
