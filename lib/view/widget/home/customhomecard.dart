import 'package:ecommerceproject/core/functions/changelangfun.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';
class CustomHomeCard extends StatelessWidget {
  final String title ;
  final String body ;
  const CustomHomeCard({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor
            ),
            child: Container(
              margin: EdgeInsets.only(top: 35),
              child: ListTile(
                title: Container(
                    margin : EdgeInsets.only(bottom: 10) ,
                    child: Text(
                      title ,
                      style: TextStyle(color: Colors.white70 , fontSize: 16),
                    )),
                subtitle: Text(
                    body,
                    style: TextStyle(color: AppColors.white , fontSize: 25)
                ),
              ),
            ),
          ),
          Positioned(
            right: changeLanguage(190.0, -23.0),
            top: changeLanguage(-25.0, -25.0),
            child: Container(
              height: 165,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black12
              ),
            ),
          )
        ],
      ),
    );
  }
}
