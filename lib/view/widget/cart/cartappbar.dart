import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  final String title ;
  const CartAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(title , style: TextStyle(fontSize: 23),),
      ),
    );
  }
}
