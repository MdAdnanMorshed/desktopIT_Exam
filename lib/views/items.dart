import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Item List'),),
        body: _buildUI()
      ),
    );
  }

  _buildUI(){
    return

      Card(
      elevation: 2,
      child: ListTile(leading: CircleAvatar(child: Text('1')),
        title: Text('Alejandro Escamilla'),
        trailing: InkWell(
            onTap: (){
              /// Details page
            },
            child: Text('Details')),
      ),
    );
  }
}
