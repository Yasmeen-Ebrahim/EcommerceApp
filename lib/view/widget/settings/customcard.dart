import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title ;
  final Widget trailing ;
  const CustomCard({super.key, required this.title, required this.trailing,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: ListTile(
          title: Text(title , style: TextStyle(fontSize: 15 , color: Colors.grey[600]),),
          trailing: trailing,
        ),
      ),
    );
  }
}
