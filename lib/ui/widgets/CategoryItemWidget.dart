import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/core/models/CategoryModel.dart';
import 'package:taskapp/ui/pages/MainAppProvider.dart';
 class CategoryItemWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItemWidget({Key key, this.categoryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<MainAppProvider>(builder: (context,mainAppProvider,child){return GestureDetector(onTap: (){
      mainAppProvider.goToNextFilterPage(categoryModel,context);
    },
      child: Container(margin: EdgeInsets.only(left: 5.0),
        padding: EdgeInsets.only(left:10.0,right: 10.0,bottom: 3.0),
        alignment: Alignment.center,decoration: BoxDecoration(
            color: Colors.white,border: Border.all(width:1.5,color: Theme.of(context).accentColor,
        ),borderRadius: BorderRadius.circular(12.0)),
        child: Row(children: [
          ImageIcon(AssetImage(categoryModel.path),color: Colors.black,),
          SizedBox(width:5.0,),
          Text(categoryModel.text,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
        ],),),
    );
    });
  }
}
