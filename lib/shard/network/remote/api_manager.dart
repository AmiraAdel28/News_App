import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/models/NewsModel.dart';
import 'package:news/models/SourcesModel.dart';
import 'package:news/shard/components/constant.dart';
import 'package:news/shard/network/remote/end_points.dart';


  class ApiManager{
 static Future<SourcesModel> getSources(String category,) async {
    var url=Uri.https(BASEURI, SOURCES,{
      'apiKey':APIKEY,
      'category':category
    });
    var response = await http.get(url);
 try{
   var bodyResponse= response.body;
   var json =jsonDecode(bodyResponse);
   var responseData=SourcesModel.fromJson(json);
   return responseData;
 }catch(e){
   throw e;
 }
  }
  
  static Future<NewsModel> getNews({String? sourceId,String?searchKehword, }) async {
   var url =Uri.https(BASEURI, EVERYTHING,{
     'apiKey':APIKEY,
     'sources':sourceId,
     'q':searchKehword,
     'language':'ar'

   });

 var response=await  http.get(url);

try{
  var bodyresponse=response.body;
  var json =jsonDecode(bodyresponse);
  var Newsresponse=NewsModel.fromJson(json);
  return Newsresponse;
}catch(error){
  throw error;

}
  }
}