import 'package:flutter/material.dart';
import 'package:news/models/NewsModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsDetailsScreen extends StatelessWidget {
 static const String routeName="newsDetails";

  @override
  Widget build(BuildContext context) {
    var articles=ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      body: Padding(
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
            SizedBox(height: 7),

            Text(articles.content??"",style: TextStyle(color:Color(0XFF42505C) ,fontSize: 13),),
            SizedBox(height: 50),
            MaterialButton(onPressed: (){
                  openUrl(articles.url);
            },
            child: 
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("View full Artical",style: TextStyle(color: Color(0XFF42505C),fontSize: 14,fontWeight: FontWeight.bold),),
                  Icon(Icons.arrow_forward_ios_outlined,color: Color(0XFF42505C),size: 14,),
                ],
              ),)
          ],
        ),
      ),
    );
  }
  openUrl(String? url) async {
    if(url==null){
      return;
    }
    var uri=Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }else{
     print("error");
    }
    
  }
}
