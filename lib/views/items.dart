

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ItemsState();
}

class ItemsState extends State<Items> {
  static int page = 0;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;

  List<dynamic> users=[];
  final dio = new Dio();



  @override
  void initState() {
    this._getMoreData(page);
    print('page'+page.toString());
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item List"),
      ),
      body: Container(
        child: _buildList(),
      ),

    );
  }

  Widget _buildList() {
    return
      CustomScrollView(

          controller: _sc,
          shrinkWrap: true,
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding:
              EdgeInsets.fromLTRB(2, 1, 4, 2),
              sliver: SliverGrid(
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 5,
                  childAspectRatio: 5,
                  crossAxisSpacing: 5,

                ),
                delegate:
                SliverChildBuilderDelegate(
                      (BuildContext context, int index) {

                    if (index == users.length) {
                      return Center(child: _buildProgressIndicator());
                    } else {
                      return _buildUI(index);
                    }
                  },
                  childCount:
                  users.length+1,
                ),
              ),
            ),
          ]);
  }


  _buildUI(index){
    return

      Card(
        elevation: 2,
        child: ListTile(leading: CircleAvatar(child: Text(users[index]['id'])),
          title: Text(users[index]['author']),
          trailing: InkWell(
              onTap: (){
                /// Details page
              },
              child: Text('Details')),
        ),
      );
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var url = "https://picsum.photos/v2/list?page="+index.toString()+"&limit=20";

      print(url);
      final response = await dio.get(url);
      print('res::'+response.statusCode.toString());


      List<dynamic> tList=[];


      for (int i = 0; i < response.data.length; i++) {

        print('data :'+response.data[i].toString());
        tList.add(response.data[i]);

      }

      print('lng'+tList.length.toString());

      setState(() {
        isLoading = false;
        users.addAll(tList);

        print('size :'+users.length.toString());
        page++;
        print('page >>>:'+page.toString());
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: Center(child: new CircularProgressIndicator()),
        ),
      ),
    );
  }

}