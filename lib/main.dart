import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sqltry/dialog.dart';
import 'package:sqltry/intro.dart';
import 'package:sqltry/models/user.dart';
import 'package:sqltry/screens/adduser.dart';
import 'package:sqltry/utils/database_helper.dart';
import 'package:sqltry/screens/update.dart';
import 'dialog.dart';

import 'dart:math' as math ;
List _users;
String c;
var db=new DataBaseHelper();
String d;
int x;
String test1;
String test2;


List<Color> color=[Colors.red,Colors.orangeAccent,Colors.blue,Colors.lightGreen];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db=new DataBaseHelper();

  _users=await db.getallusers();
//  for(int i=0;i<_users.length;i++){
//    User user=User.map(_users[i]);
 //   print("User username : ${user.username}");



 // }
  runApp(
      MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "love",

      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    Random r=new Random();



    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(



      backgroundColor : Colors.white,
      appBar: AppBar(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15),bottomRight:Radius.circular(15))),

        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Notes",style: TextStyle(
                color: Colors.black
              ),),
              Icon(Icons.assignment,color: Colors.black,),
            ],
          ),
        ),
        elevation: 8,
        backgroundColor: Colors.white,
      ),

     // backgroundColor: Colors.blue,
      body:Stack(

        children: <Widget>[

          StaggeredGridView.countBuilder(

            crossAxisCount: 4,
            itemCount: _users.length,
            itemBuilder:  (_,int position){
              return GestureDetector(
                onTap: ()async {
                  await Navigator.push(context, MaterialPageRoute(builder: (context)=>updateuser(
                      User.fromMap(_users[position]).id,
                      User.fromMap(_users[position]).description,
                      User.fromMap(_users[position]).username)));
                  _users=await db.getallusers();
                  setState(() {


                  });
                },
                onDoubleTap: () async {
                   _delete(User.fromMap(_users[position]).id,position);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,right: 5,left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),



                      color: color[x=r.nextInt(3)].withOpacity(0.5)

                      //  color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.3),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        child: ListTile(


                          title: Padding(
                            padding: const EdgeInsets.only(left: 17,bottom: 10),
                            child: Text("${User.fromMap(_users[position]).username} ",style: TextStyle(
                              fontSize: 19.75,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Casual"
                            ),
                            ),
                          ),
                          subtitle: Text("- ${User.fromMap(_users[position]).description} ",style: TextStyle(
                              fontSize:15,
                              fontWeight: FontWeight.w600,

                          )),
                        ),
                      ),
                    ),

                  ),
                ),
              );
            },
            staggeredTileBuilder: (int index)=>new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 6.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(


                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    FloatingActionButton(
                      onPressed: ()async  {



                        var db=new DataBaseHelper();

                       await Navigator.push(context, MaterialPageRoute(builder: (context)=>adduser()));



                       _users=await db.getallusers();
                       setState(() {

                       });


                      },
                      elevation: 20,
                      backgroundColor: Colors.black,
                      child:Icon(Icons.add,color: Colors.white,),

                    ),
                  ],
                ),
              ),
            ],
          )
        ],

      ),



      );

  }

  _delete(int posi,int id)async  {
    await db.deleteUser(posi);
    setState(() {
      _users.removeAt(id);
    });

  }
}
