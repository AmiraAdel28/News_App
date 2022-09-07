import 'package:flutter/material.dart';
import 'package:news/models/category.dart';

class CategoryWidget extends StatelessWidget {
Category category;
int index;
CategoryWidget(this.category,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.ColorCode,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(index%2!=0?0:25),
            bottomRight: Radius.circular(index%2==0?0:25)
        )
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset(category.imgUrl),
          Text(category.title,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 22
          ),),

        ],
      ),
    );
  }
}
