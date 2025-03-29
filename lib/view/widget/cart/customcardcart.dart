import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';

class CustomCardCart extends StatelessWidget {
  final String name ;
  final String price ;
  final String count ;
  final String image ;
  final void Function()? onPresseadd ;
  final void Function()? onPresseremove ;
  const CustomCardCart({super.key, required this.name, required this.price, required this.count,required this.onPresseadd,required this.onPresseremove, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  height: 100,
                  child: CachedNetworkImage(imageUrl: image),
              )
          ),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name , style: TextStyle(color: AppColors.black , fontSize: 16),),
                  SizedBox(height: 10,),
                  Text("$price \$" , style:TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold , fontSize: 17),),
                ],)
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                      height : 40,
                      child: IconButton(onPressed: onPresseadd, icon: Icon(Icons.add))
                  ),
                  Container(
                      height : 30,
                      child: Text(count)),
                  Container(
                      height : 30,
                      child: IconButton(onPressed: onPresseremove, icon: Icon(Icons.remove))),
                ],)
          )
        ],
      ),
    );
  }
}
