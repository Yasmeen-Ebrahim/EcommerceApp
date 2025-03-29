import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: const Column(
              children: [
                Icon(Icons.school_rounded),
                SizedBox(height: 10,),
                Text("App" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
