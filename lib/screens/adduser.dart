import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sqltry/dialog.dart';
import 'package:sqltry/models/user.dart';
import 'package:sqltry/utils/database_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
var txt1 = TextEditingController();
int x;
var txt2 = TextEditingController();
String title;
String desc;
List<Color> color=[Colors.orangeAccent,Colors.blue];
class adduser extends StatefulWidget {




  @override
  _adduserState createState() => _adduserState();
}


class _adduserState extends State<adduser> {
  Random r=new Random();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 20,

        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.assignment,color: Colors.black,),
              Text("ADD A NOTE",style: TextStyle(
                fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800,
                  color: Colors.black

              ),),

            ],
          ),
        ),
      ),
      body:Stack(
        children: <Widget>[
          TopBar(),
          ADDnote()


        ],
      ) ,


    );
  }
}

class ADDnote extends StatelessWidget {
  const ADDnote({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(top: height*0.25,left: width*0.05,right: width*0.05),

          child: Column(



            children: <Widget>[


              Text("Title",style: TextStyle(

                fontFamily: "Casual",
                fontSize: 28,
                fontWeight: FontWeight.bold,

              ),),

              Card(
                elevation: 5,
                color: Colors.white,
                child: TextField(


                  controller: txt1,


                  onChanged: (value){
                    title=value;

                  },



                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text("Description",style: TextStyle(
                fontFamily: "Casual",
                fontSize: 28,
                fontWeight: FontWeight.bold,

              ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: TextField(

                  controller: txt2,
                  onChanged: (value){
                    desc=value;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,


                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                elevation: 4,
                color: Colors.white,
                child: FlatButton(
                  padding: EdgeInsets.all(15),
                  child: Text("SAVE"),
                  onPressed: ()async {
                    var db=new DataBaseHelper();
                    if(desc==null ||  title==null){
                      Fluttertoast.showToast(
                          msg: "Please write something ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );

                    }
                    else{
                      int res1=await db.saveuser(new User("$title","$desc"));
                      print("saved user $res1");
                      txt1.text="";
                      txt2.text="";
                      desc=null;
                      title=null;
                      Navigator.pop(context);
                    }






                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
