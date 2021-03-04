import 'package:flutter/material.dart';

 class TextFormFieldUi extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: false,
      textInputAction: TextInputAction.done,textAlign: TextAlign.start,
      style: TextStyle( fontSize: 14.0, color: Color(0xff748A9D)),
      decoration: InputDecoration(
          hintText: 'مثال : سماعة الطبيب',
          prefixIcon: Icon(Icons.search,size: 35.0,color: Colors.grey.withOpacity(0.25), ),
        hintStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.grey.withOpacity(0.5).withOpacity(0.5)),
          contentPadding: EdgeInsets.only(top:10.0),
          suffixIcon: null,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
           ),
    );
  }
}
