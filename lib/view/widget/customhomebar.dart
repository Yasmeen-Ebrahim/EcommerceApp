import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:flutter/material.dart';
import '../../core/functions/changelangfun.dart';
class CustomHomeBar extends StatelessWidget {
  final String searchtitle ;
  final void Function()? searchpress ;
  final void Function()? notificationpress ;
  final void Function()? favoritepress ;
  final TextEditingController myController ;
  final Function(String)? onChanged ;
  const CustomHomeBar({super.key, required this.searchtitle, required this.searchpress, required this.notificationpress,required this.favoritepress,required this.onChanged, required this.myController});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(child: Container(
            margin: changeLanguage(EdgeInsets.only(left: 8), EdgeInsets.only(right: 4)),
            child: TextFormField(
              onChanged: onChanged,
              controller: myController,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search , color: AppColors.grey,),
                    onPressed: searchpress,
                  ),
                  hintText: searchtitle,
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          )),
            Container(
              margin: EdgeInsets.only(right: 5),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)
              ),
              child: IconButton(
                icon: Icon(Icons.notifications_active_outlined , color: AppColors.grey,),
                onPressed: notificationpress
            ),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)
            ),
            child: IconButton(
                icon: Icon(Icons.favorite_border_outlined , color: AppColors.grey,),
                onPressed: favoritepress
            ),
          ),
        ],
      ),
    );
  }
}
