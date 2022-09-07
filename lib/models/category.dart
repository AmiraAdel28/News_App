import 'package:flutter/cupertino.dart';

class Category{
  String id;
  String title;
  String imgUrl;
  Color ColorCode;
  Category(this.id,this.title,this.imgUrl,this.ColorCode);


   static List<Category> getCategories(){
    return[

      Category('sports', 'Sports', "assets/images/sports.png",Color(0XFFC91C22)),
      Category('general', 'General', "assets/images/politics.png", Color(0XFF003E90)),
      Category("health", 'Health', "assets/images/health.png", Color(0XFFED1E79)),
      Category("business", 'Business', "assets/images/bussines.png", Color(0XFFCF7E48)),
      Category("entertainment", 'Entertainment', "assets/images/environment.png", Color(0XFF4882CF)),
      Category('science', 'Science', "assets/images/science.png", Color(0XFFF2D352)),
    ];


  }
}