import 'package:flutter/material.dart';

class TableRowInfo extends StatelessWidget{
  final String info ;
  const TableRowInfo({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Text(
          info ,
          style: TextStyle(fontSize: 13),
          textAlign: TextAlign.center,)
    );
  }
}
