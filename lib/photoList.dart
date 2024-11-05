import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:photos/detailsPage.dart';
import 'package:photos/photo.dart';

class PhotoList extends StatefulWidget {
  const PhotoList({super.key});

  @override
  State<PhotoList> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  // Sample data for the list
  List<Photos> productList = [];

  @override
  void initState() {
    getProductListFromApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          productList[index].thumbnailUrl??''
                        ),
                        fit: BoxFit.cover,
                      ),

                    ),
                  ),
                  title: Text(productList[index].title??'',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage(
                          photoUrl: productList[index].url,
                          title: productList[index].title,
                          id: productList[index].id.toString(),
                        )));

                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getProductListFromApi() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(uri);
    print(response);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode==200){
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        for (var item in decodedResponse) {
          Photos product = Photos.fromJson(item);
          productList.add(product);
        }
        setState(() {

        });
    }
      }
    }
  }