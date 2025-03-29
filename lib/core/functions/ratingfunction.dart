import 'package:ecommerceproject/core/constant/colors.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';


  final _dialog = RatingDialog(
    initialRating: 1.0,
    // your app's name?
    title: Text(
      'Rating Dialog',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
    ),
    // encourage your user to leave a high rating?
    message: Text(
      'Tap a star to set your rating. Add more description here if you want.',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 14),
    ),
    // your app's logo?
     image: Image.asset("assets/images/ratelogo.png" , width: 200, height: 200,),
    submitButtonText: 'Submit',
    submitButtonTextStyle: TextStyle(color: AppColors.primaryColor , fontWeight: FontWeight.bold , fontSize: 16),
    commentHint: 'Set your custom comment hint',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');
    },
  );


  // show the dialog
 showRatingDialog(BuildContext context){
   showDialog(
     context: context,
     barrierDismissible: true, // set to false if you want to force a rating
     builder: (context) => _dialog,
   );
 }