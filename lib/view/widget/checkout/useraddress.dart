import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';

class UserAddress extends StatelessWidget {
  final bool isActive ;
  final String title ;
  final String location ;
  const UserAddress({super.key, required this.isActive, required this.title, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: isActive == true ? AppColors.primaryColor : AppColors.background,
        child: ListTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16 , color: isActive == true ? AppColors.white : AppColors.primaryColor),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4,),
              Text(location , style: TextStyle(color: isActive == true ? AppColors.white : AppColors.primaryColor , fontSize: 11,),),
            ],
          ),
        ),
      ),
    );
  }
}
