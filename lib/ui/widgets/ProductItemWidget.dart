import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/core/models/ProductModel.dart';
import 'package:taskapp/ui/pages/MainAppProvider.dart';
class ProductItemWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductItemWidget({Key key, this.productModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<MainAppProvider>(builder: (context,mainAppProvider,child){
      return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      margin: EdgeInsets.only(bottom: 10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white,
          border: Border.all(
            width: 1.5,
            color: Theme.of(context).accentColor,
          ),
          borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: Image.asset(
                  productModel.path,
                  height: 120.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  left: 10.0,
                  top: 10.0,
                  child: GestureDetector(onTap: (){
                    mainAppProvider.triggerFavoriteState();
                  },
                    child:  Icon(
                                Icons.favorite_border,
                                color: mainAppProvider.favoriteState?Colors.green:Colors.white,
                              ),
                  ))
            ],
          ),
          SizedBox(
            height:5.0,
          ),
          Padding(padding: EdgeInsets.only(left: 10.0,right: 10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Text(productModel.title,style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
              Text(' الكمية',style: TextStyle(color: Colors.black87,fontSize: 20.0))
            ],),
          ),
          SizedBox(
            height:5.0,
          ),
          Padding(padding: EdgeInsets.only(left: 10.0,right: 10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Text(productModel.description,style: Theme.of(context).textTheme.headline1,),
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: '${productModel.quantity}',style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20.0,color: Colors.grey.withOpacity(0.5))),
                    TextSpan(text: ' عنصر', style:Theme.of(context).textTheme.headline1,),

                  ],
                ),
              )
              //  Text('${productModel.quantity}  عنصر',style: Theme.of(context).textTheme.headline1,)
            ],),
          )
        ],
      ),
    );});
  }
}
