import 'package:ecommerceproject/controller/cart/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';

class BottomNavigationBarCart extends StatelessWidget {
  final String price ;
  final String discount ;
  final String shipping ;
  final String totalprice ;
  final void Function()? pressOrder ;
  final TextEditingController couponControl ;
  final void Function()? onapply ;
  const BottomNavigationBarCart({super.key, required this.price, required this.shipping, required this.totalprice, required this.couponControl,required this.onapply, required this.discount,required this.pressOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2 , left: 17 , right: 17),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartControllerImp>(builder: (controller){
            return controller.isCheck == false ? Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: couponControl,
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.only(top: 5 , bottom: 5 , left: 10),
                            hintText: "Coupon Code",
                            hintStyle: TextStyle(color: AppColors.bodytext,fontSize: 14),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primaryColor)
                            )
                        ),
                      )
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      color: AppColors.primaryColor,
                      textColor: AppColors.white,
                      child: Text("apply"),
                      onPressed: onapply,
                    ),
                  )
                ],
              ),
            ): Text("Coupon Code : ${controller.couponName}");
          }),
          SizedBox(height: 5,),
          Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryColor , width: 2)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price"),
                    Text("$price \$")
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount"),
                    Text("$discount %")
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shipping"),
                    Text("$shipping \$")
                  ],
                ),
                SizedBox(height: 3,),
                Divider(),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Price" , style: TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold),),
                    Text("$totalprice \$", style: TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 8,)
              ],
            ),
          ),
          SizedBox(height: 15,),
          MaterialButton(
            padding: EdgeInsets.symmetric(horizontal : 125 , vertical: 10),
            onPressed: pressOrder,
            child: Text("Place Order" , style: TextStyle(color: AppColors.white),),
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
