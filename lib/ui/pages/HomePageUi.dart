import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/ui/componentui/CustomAppBar.dart';
import 'package:taskapp/ui/componentui/SearchUi.dart';
import 'package:taskapp/ui/widgets/CategoryItemWidget.dart';
import 'package:taskapp/ui/widgets/ProductItemWidget.dart';
import 'MainAppProvider.dart';

// ignore: must_be_immutable
class HomePageUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar:
                  customAppBar('نتائج البحث', Theme.of(context).accentColor),
              body: Consumer<MainAppProvider>(
                  builder: (context, mainAppProvider, child) {
                return Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchUi(),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 40.0,
                        child: ListView.builder(
                            reverse: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: mainAppProvider.itemsCategory.length,
                            itemBuilder: (context, index) {
                              return CategoryItemWidget(
                                categoryModel:
                                    mainAppProvider.itemsCategory[index],
                              );
                            }),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount:  mainAppProvider.itemsProduct.length,
                              itemBuilder: (context, index) {
                                return ProductItemWidget(productModel:mainAppProvider.itemsProduct[index],);
                              }))
                    ],
                  ),
                );
              }))),
    );
  }
}
