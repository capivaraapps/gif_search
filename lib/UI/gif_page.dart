import 'dart:typed_data';

import "package:flutter/material.dart";
import 'package:esys_flutter_share/esys_flutter_share.dart';
import "package:http/http.dart" as http;

class GifPage extends StatelessWidget {
  final Map _gifData;

  GifPage(this._gifData);

  Future<Uint8List> _getGif() async {
    http.Response response = await http.get(_gifData["images"]["original"]["url"]);
    return response.bodyBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"]),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              _getGif().then((value) => {
                Share.file("gif", "gif.gif", value, "image/gif", text: "olha o gif")
              });
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(_gifData["images"]["original"]["url"]),
      ),
    );
  }
}
