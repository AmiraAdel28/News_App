import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/models/NewsModel.dart';
import 'package:news/modules/home/details/news_details_screen.dart';

class NewsItem extends StatelessWidget {

  Articles articles;
  NewsItem(this.articles);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(NewsDetailsScreen.routeName,
        arguments: articles,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(articles.urlToImage??"",height: 180,fit: BoxFit.fill,)),
            SizedBox(height: 5,),
            Text(articles.author??"",style: TextStyle(color: Color(0XFF79828B),fontSize: 10),),
            SizedBox(height: 5,),
            Text(articles.title??"",style: Theme.of(context).textTheme.headline1!.copyWith(
              color: Color(0XFF42505C),fontSize: 14
            ),),
            SizedBox(height: 5,),
            Text(articles.publishedAt?.substring(0,10)??"",textAlign: TextAlign.right,
            style: TextStyle(color: Color(0XFFA3A3A3),fontSize: 13),),

          ],
        ),
      ),
    );
  }
}
