import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Center(child: Text("we are back again "),),
        ],
      ),
    );
  }
}
