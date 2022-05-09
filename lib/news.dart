import "package:flutter/material.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
const apiKey = "499010e14d7d448597f47691b1746bca";
const newsURL = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$apiKey";



class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {

 // Map? mapResponse;   this can actually be used.
List listOfArticles =[];

  @override
  void initState(){
    getNewsNetwork();
    super.initState();
  }

  Future getNewsNetwork( ) async {
    http.Response response = await http.get(Uri.parse(newsURL));
    print(response.body);
    // String data = response.body;
     if (response.statusCode == 200) {
       setState(() {
     var  mapResponse = jsonDecode(response.body);
        // mapResponse = jsonDecode(response.body); or above
         listOfArticles = mapResponse!['articles'];
       });
     }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BBC NEWS"),
        centerTitle: true,
      ),
  body:/*mapResponse or */ listOfArticles  == null ?  const Center(
    child: SpinKitDoubleBounce(
      color: Colors.grey,
      size: 50.0,
      //  duration: Duration(milliseconds: 30),
    ),
  )   :
      RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.red,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          getNewsNetwork();
        },
        child: ListView.builder(
          shrinkWrap: true,
           // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.network(listOfArticles[index]['urlToImage']),
                    Text(
                      listOfArticles[index]['title'].toString(),
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      listOfArticles[index]['description'].toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          itemCount:  listOfArticles.length ,

            ),
      ),
  );

  }
}
// class DataModel {
//
//   String? author;
//   String? title;
//   String? url;
//   String? content;
//
//   DataModel(this.content, this.author, this.title, this.url);
// }
