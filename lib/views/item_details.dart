

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Card(
              child: Container(
                  height: 100,
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      Text('Book Information',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                       Divider(height: 1,thickness: 1,),
                      Text('Author : '+ widget.users['author'].toString()),
                      Text('Width :'+widget.users['width'].toString()),
                      Text('Height :'+widget.users['height'].toString()),

                    ],
                  )),
            ),
            SizedBox(height: 10,),
            Card(
              child: Container(
                  height: 100,
                  width: double.infinity,

                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('URL',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text(widget.users['url'].toString()),
                      TextButton(
                        child: Text('Clickable Here'),onPressed: (){
                        /// Clickable Here
                      },)

                    ],
                  )),
            ),

            SizedBox(height: 10,),
            Card(
              child: Container(
                  height: 100,
                  width: double.infinity,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('DownLoad ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text(widget.users['download_url'].toString()),
                      TextButton(
                        onPressed: (){},
                        child:
                        Icon(Icons.arrow_circle_down_outlined)
                       )

                    ],
                  )),
            ),

            SizedBox(height: 10,),
          ],
        ),
      ),

    );
  }
}
