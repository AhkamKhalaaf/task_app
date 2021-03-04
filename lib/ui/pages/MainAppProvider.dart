import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskapp/core/models/CategoryFilterModel.dart';
import 'package:taskapp/core/models/CategoryModel.dart';
import 'package:taskapp/core/models/ProductModel.dart';
import 'package:taskapp/ui/pages/FilterPageUi.dart';

class MainAppProvider extends ChangeNotifier
{
  List<CategoryModel> itemsCategory = [
    CategoryModel('assets/icons/icon1.png', 'طبية'),
    CategoryModel('assets/icons/icon2.png', 'منازل'),
    CategoryModel('assets/icons/icon3.png', 'أحذية'),
    CategoryModel('assets/icons/icon4.png', 'مساجد')
  ];
List<CategoryFilterModel>allItemsTitle=[CategoryFilterModel('طبية','فيتامينات'),
  CategoryFilterModel('طبية','ادوية'),
  CategoryFilterModel('طبية','مسكنات'),
  CategoryFilterModel('طبية','مضادات حيوية'),


  CategoryFilterModel('منازل','بيوت'),
  CategoryFilterModel('منازل','شقق'),
  CategoryFilterModel('منازل','شاليهات'),
  CategoryFilterModel('منازل','عمارات'),


  CategoryFilterModel('أحذية',' كوتشيات'),
  CategoryFilterModel('أحذية','سواريهات '),
  CategoryFilterModel('أحذية','مستورد'),
  CategoryFilterModel('أحذية','صنادل'),


  CategoryFilterModel('مساجد','تحفيظ'),
  CategoryFilterModel('مساجد','دار مناسبات'),
  CategoryFilterModel('مساجد','مساجد كبيرة'),
  CategoryFilterModel('مساجد','مساجد وسط'),


];
  List<ProductModel>itemsProduct=[
    ProductModel('طبية','علاج ممتاز','علاج طبي هام هام جداااا',
    'assets/images/med1.jpg',10),
    ProductModel('طبية','علاج طبي','علاج طبي ممتاز للصداع',
        'assets/images/med2.jpg',15),
    ProductModel('طبية','علاج طبي للامراض','من أفضل العلاجات الطبية الموجودة',
        'assets/images/med4.jpg',20),
    ProductModel('منازل','منزل كبير','منزل ضخم ورائع',
        'assets/images/hous1.jpg',13),
    ProductModel('منازل','منزل متوسط','منزل يطل علي البحر',
        'assets/images/hous2.jpg',16),
    ProductModel('منازل','منزل صغير','منزل رائع للاسرة',
        'assets/images/hous3.jpg',18),
    ProductModel('منازل','منزل جميل','منزل كبير جيد التهوية',
        'assets/images/hous4.jpg',19),
    ProductModel('مساجد','مسجد كبير','مسجد له تراث تاريخي كبير منذ القدم',
        'assets/images/mos1.jpg',13),
    ProductModel('مساجد','مسجد 2','مسجد كبير يجمع عدد كبير من المصليين',
        'assets/images/mosq2.jpg',16),
    ProductModel('مساجد','مسجد 3','مسجد الرحمن الرحيم',
        'assets/images/mosq3.jpg',18),
    ProductModel('مساجد','مسجد4',' مسجد مساحته كبيرة جدا ',
        'assets/images/mosq4.jpg',18),
    ProductModel('أحذية','حذاء جميل','حذاء رائع عليه خصم',
        'assets/images/shoe1.jpg',13),
    ProductModel('أحذية','حذاء كوتشي','حذاء مشي',
        'assets/images/shoe2.jpg',16),
    ProductModel('أحذية','حذاء ملون','حذاء طبي',
        'assets/images/shoe3.jpg',18),
  ];
  bool favoriteState=false;
  CategoryModel selectedCategory;
  List<ProductModel>listFilterProducts=[];
  List<CategoryFilterModel>listSubTitle=[];
  triggerFavoriteState()
  {
    favoriteState=!favoriteState;
    notifyListeners();
  }
  goToNextFilterPage(CategoryModel categoryModel,BuildContext context)
  {
    listSubTitle=[];
    listFilterProducts=[];
    selectedCategory=categoryModel;
    allItemsTitle.forEach((element) {
      if(element.type==categoryModel.text)
        {
          listSubTitle.add(element);
        }
    });
    itemsProduct.forEach((element) {
      if(element.type==categoryModel.text)
        {
          listFilterProducts.add(element);
        }
    });
    notifyListeners();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilterPageUi()),
    );
  }
  backAction(BuildContext context)
  {

    Navigator.of(context).pop();
  }
}