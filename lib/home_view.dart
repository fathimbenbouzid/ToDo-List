import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/Sign');
        },
        child: const Text("signup"),
      ),
    );
  }
}
