

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier{
   String AppLanguage ='en';
  void ChangeAppLanguage(String languageCode){
   AppLanguage=languageCode;
   notifyListeners();

}

}