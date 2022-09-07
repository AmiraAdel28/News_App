import 'package:flutter/material.dart';
import 'package:news/models/SourcesModel.dart';
import 'package:news/models/category.dart';
import 'package:news/modules/home/tab_controller.dart';
import 'package:news/shard/network/remote/api_manager.dart';

class NewsFragment extends StatelessWidget {
  static const String routeName="news";
  Category category;
  NewsFragment(this.category);

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder<SourcesModel>(
          future: ApiManager.getSources(category.id),
          builder: (context, snapshot) {
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
            var sourcesList=snapshot.data?.sources??[];
            return TabsController(sourcesList);
          });

  }
}
