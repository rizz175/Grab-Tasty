import 'package:grabtasty/core/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextRowWidgets extends StatelessWidget {

  String? title;
  String? value;


  TextRowWidgets({required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child:Texts.textBlock("$title:",fontFamily:"RobotoRegular",fontWeight: FontWeight.w200,color: Colors.black54,size: 15),
            ),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Container(
              child:Texts.textBlock(value??"",maxline: 2,size: 15),
            ),
          )
        ],
      ),
    );
  }
}
class TextRowTwoWidgets extends StatelessWidget {

  String? title;
  String? value;


  TextRowTwoWidgets({required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Texts.textBlock("$title:",fontFamily:"RobotoRegular",fontWeight: FontWeight.w200,color: Colors.black54,size: 15),
          Texts.textNormal("${value??""}",fontFamily:"RobotoRegular",color: Colors.black54,size: 15),


        ],
      ),
    );
  }
}
