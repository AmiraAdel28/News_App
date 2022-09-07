import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/setting/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  Function onMenuItemClicked;
  HomeDrawer(this.onMenuItemClicked);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 85,
            width: double .infinity,
            color: Color(0XFF39A552),
            child: Center(child: Text("${AppLocalizations.of(context)!.newsapp}!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
          ),
                InkWell(
                  onTap: (){
                    onMenuItemClicked();

                  },
                  child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
       child: Row(
         children: [
           Icon(Icons.menu,size: 22,color: Color(0XFF303030),),
           SizedBox(width: 10,),
           Text(AppLocalizations.of(context)!.categories,style: TextStyle(fontSize: 24,color:Color(0XFF303030),fontWeight: FontWeight.bold ))
         ],
       ),
   ),
                ),
          SizedBox(height: 8,),
                InkWell(
                  onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
                  },
                  child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            child: Row(
              children: [
                  Icon(Icons.settings,size: 22,color: Color(0XFF303030),),
                  SizedBox(width: 10,),
                  Text(AppLocalizations.of(context)!.setting,style: TextStyle(fontSize: 24,color:Color(0XFF303030),fontWeight: FontWeight.bold ))
              ],
            ),
          ),
                ),
        ],
      ),
    );
  }
}
