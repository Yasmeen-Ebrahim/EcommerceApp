import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceproject/controller/itemdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ImageDetail extends GetView<ItemDetailsControllerImp> {
  const ImageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          color: Colors.indigo[200],
        ),
        Hero(
          tag: "${controller.itemDatails.itemsId}",
          child: Container(
            margin: EdgeInsets.only(left: 20 , right: 20 , top: 70),
            child: CachedNetworkImage(
              imageUrl: "${controller.itemDatails.itemsImage}",
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
