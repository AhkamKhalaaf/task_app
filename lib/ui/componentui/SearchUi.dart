import 'package:flutter/material.dart';
import 'package:taskapp/ui/componentui/TextFormFieldUi.dart';
class SearchUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column( mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,children: [
      Container(height: 1.0,width: MediaQuery.of(context).size.width,color: Colors.grey.withOpacity(0.25),),
      TextFormFieldUi(),
        Container(height: 1.0,width: MediaQuery.of(context).size.width,color: Colors.grey.withOpacity(0.25),),

    ],);
  }
}
