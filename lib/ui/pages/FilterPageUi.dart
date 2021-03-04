import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/ui/componentui/CustomAppBar.dart';
import 'package:taskapp/ui/componentui/SearchUi.dart';
import 'package:taskapp/ui/pages/MainAppProvider.dart';
import 'package:taskapp/ui/widgets/ProductItemWidget.dart';

// ignore: must_be_immutable
class FilterPageUi extends StatelessWidget {
//MainAppProvider
  @override
  Widget build(BuildContext context) {
    return Consumer<MainAppProvider>(
        builder: (context, mainAppProvider, child) {
      return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
              child: Scaffold(
                  resizeToAvoidBottomPadding: false,
                  appBar: customAppBar(
                      'نتائج البحث', Theme.of(context).accentColor),
                  body: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
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
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                mainAppProvider.backAction(context);
                              },
                              child: Container(
                                height: 40.0,
                                margin: EdgeInsets.only(left: 5.0),
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0,bottom: 3.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    border: Border.all(
                                      width: 1.5,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Row(
                                  children: [
                                    ImageIcon(AssetImage(
                                        mainAppProvider.selectedCategory.path),
                                    color: Colors.white,),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      mainAppProvider.selectedCategory.text,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 40.0,
                                child: ListView.builder(
                                    reverse: false,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        mainAppProvider.listSubTitle.length,
                                    itemBuilder: (context, index) {

                                      return
                                        Container(
                                        margin: EdgeInsets.only(left: 5.0),
                                        padding: EdgeInsets.only(bottom: 3.0,
                                            left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 1.5,
                                              color:
                                                  Theme.of(context).accentColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: Text(mainAppProvider
                                            .listSubTitle[index].title,style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: mainAppProvider.listFilterProducts.length,
                                itemBuilder: (context, index) {
                                  return ProductItemWidget(productModel:mainAppProvider
                                                   .listFilterProducts[index],);

                                }))
                      ],
                    ),
                  ))));
    });
  }
}
