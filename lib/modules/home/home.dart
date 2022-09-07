import 'package:flutter/material.dart';
import 'package:news/models/NewsModel.dart';
import 'package:news/models/category.dart';
import 'package:news/modules/home/category_screen.dart';
import 'package:news/modules/home/drawer.dart';
import 'package:news/modules/home/news_fragment.dart';
import 'package:news/modules/home/news_item.dart';
import 'package:news/shard/network/remote/api_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
 static const String routrName="homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child:
        HomeDrawer(onMenuItemClicked),),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.news),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context,
                delegate: NewsSearch());

          }, icon: Icon(Icons.search,color: Colors.white,size: 28,))
        ],
      ),
      body: IsSelectedCategory==null?CategorysScreen(onClickedItem):NewsFragment(IsSelectedCategory!),
    );
  }

   Category? IsSelectedCategory;
  onMenuItemClicked(){
    Navigator.pop(context);
    IsSelectedCategory=null;
    setState(() {

    });
  }
 onClickedItem(Category){
  IsSelectedCategory=Category;
  setState(() {

  });
 }
}
class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
     return[
       IconButton(onPressed: (){
         showResults(context);
       },
           icon: Icon(Icons.search,color: Colors.grey,size: 28,))

     ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
return IconButton(onPressed: (){

  Navigator.pop(context);
},
    icon: Icon(Icons.clear,size: 28,));
  }

  @override
  Widget buildResults(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(12.0),
     child: FutureBuilder<NewsModel>(
         future: ApiManager.getNews(searchKehword: query),
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
         }),
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text(AppLocalizations.of(context)!.noresult));

  }

}
