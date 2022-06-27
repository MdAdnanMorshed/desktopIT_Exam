

import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {

  var users;


  ItemDetails(this.users);


  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.users['author']),
      ),
      body: Column(
        children: [
          Text('width :'+widget.users['width'].toString()),
          Text('height :'+widget.users['height'].toString()),
          Text('url :'+widget.users['url'].toString()),
          Text('download_url :'+widget.users['download_url'].toString()),
        ],
      ),

    );
  }
}
