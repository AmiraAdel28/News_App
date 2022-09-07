import 'package:flutter/material.dart';
import 'package:news/models/category.dart';
import 'package:news/modules/home/category_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategorysScreen extends StatelessWidget {
var categories=Category.getCategories();
Function onClickedItem;
CategorysScreen(this.onClickedItem);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.pickyourcategory,style: Theme.of(context).textTheme.headline1!.copyWith(
            color: Color(0XFF4F5A69),fontSize: 22
          ),
          ),
          SizedBox(height: 25,),

          Expanded(
            child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10
            ),
                itemBuilder: (context,index){

              return InkWell(
                  onTap: (){
                    onClickedItem(categories[index]);
                  },
                  child: CategoryWidget(categories[index],index));

                }),
          )
        ],
      ),
    );
  }

}
