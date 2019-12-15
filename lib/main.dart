import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List_Remove_Swipe",
      theme:  ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHome(),
    );
  }
}
class MyHome extends StatelessWidget {
  final List<String> items = new List<String>.generate(30,(i) =>"Items${i+1}");
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to Dimiss"),
        centerTitle: true,
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder:(context,int index){
          final item = items[index];
          return Dismissible(
           key: Key(item[index]),
            onDismissed: (direction){
            items.removeAt(index);
             Scaffold.of(context).showSnackBar(SnackBar(
               content: Text("Item Removed"),
             ));
            },
            background: Container(color: Colors.red[900],),
            child: ListTile(
              title: Text("${item[index]}"),
            ),
          );
        } ,
      ),
    );
  }
}


