import 'package:flutter/material.dart';
import 'package:news/models/NewsModel.dart';
import 'package:news/models/SourcesModel.dart';
import 'package:news/modules/home/news_item.dart';
import 'package:news/shard/network/remote/api_manager.dart';

class NewsData extends StatelessWidget {
  Sources sources;
  NewsData(this.sources);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
        future: ApiManager.getNews(sourceId: sources.id!?? ""),
        builder: (c,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Column(
              children: [
                Text("something went wrong"),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Colors.green,
                  onPressed: (){},
                  child: Text("Try Agin"),)
              ],
            );
          }
          if("ok"==snapshot.data!.status){
            Column(
              children: [
                Text("something went wrong"),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Colors.green,
                  onPressed: (){},
                  child: Text("Try Agin"),)
              ],
            );
          }
          var newsList=snapshot.data?.articles??[];
          return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index){

            return NewsItem(newsList[index]);
          });
        });
        
  }
}
