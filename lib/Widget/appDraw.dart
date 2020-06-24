
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    List _menu = ["Home", "Shop by Category","Your Order","Cart", "Search", "FAQ"  ];
    return Drawer(
         child: ListView(
          // shrinkWrap: true,
           
     children: <Widget>[
       _drawHeader(context),
       _drawItem(_menu),
     ],


          )
    );
  }

Widget _drawHeader( BuildContext context){
  return DrawerHeader(child: 
 Column(children: <Widget>[ 
   Expanded(child:  CircleAvatar( radius: 40,child: FlutterLogo(), )),
   Text("Avnish" , style: Theme.of(context).textTheme.headline6,),
   Text("9971604962", style: Theme.of(context).textTheme.bodyText2,),
 
 
 ],));

  //Container(child: CircleAvatar(child: FlutterLogo(),),));
  
}
//
Widget _drawItem( List menu ){
  return ListView.builder(
    shrinkWrap: true,
    itemCount: menu.length,
    itemBuilder: (_,index){
         
    
   if(menu[index] == "Your Order" || menu[index] == "FAQ"){
        
           return 
           ListView(shrinkWrap: true,
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Divider(),
             ),
             ListTile(leading: FlutterLogo(), title: Text(menu[index]),),

           ],);
          //  ListView(
        
          //   
          // );
      }
      else if (menu[index] == "Shop by Category" )
    {
      return ExpansionTile( leading: FlutterLogo(),
        title: Text(menu[index]),
      children: <Widget>[
        ListView(
          shrinkWrap: true,
          children: <Widget>[
          ListTile(title: Text("ant snaht")),
          ListTile(title: Text("ant snaht")),
          ListTile(title: Text("ant snaht")),
          ListTile(title: Text("ant snaht")),
          ListTile(title: Text("ant snaht")),
          ]
        )
      ],
       );
      

    }
      else
      return ListTile(leading: FlutterLogo(), title: Text(menu[index]),);
    });
}



}