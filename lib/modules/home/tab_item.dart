import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/SourcesModel.dart';

class TabItem extends StatelessWidget {

Sources sources;
bool isSelected;
TabItem(this.sources,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      margin: EdgeInsets.symmetric(vertical: 12,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0XFF39A552),
        ),
        color: isSelected ? Color(0XFF39A552):Colors.transparent
      ),
      child: Text(sources.name??'',style:
        TextStyle( color:isSelected ? Colors.white:Color(0XFF39A552)),),
    );
  }
}
