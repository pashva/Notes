import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sqltry/dialog.dart';
import 'package:sqltry/models/user.dart';
import 'package:sqltry/screens/adduser.dart';
import 'package:sqltry/utils/database_helper.dart';
var txt1 = TextEditingController();

var txt2 = TextEditingController();

class updateuser extends StatefulWidget {
  updateuser(this.id,this.descript,this.titles);
  final id;
  final descript;
  final titles;

  @override
  _updateuserState createState() => _updateuserState();
}
String ti;
String d;
class _updateuserState extends State<updateuser> {
  @override
  Widget build(BuildContext context) {
    int id2=widget.id;
    String dess=widget.descript;
    String tits=widget.titles;
    txt1.text=tits;
    txt2.text=dess;
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        elevation: 20,

        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.assignment,color: Colors.black,),
              Text("UPDATE A NOTE",style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800,
                  color: Colors.black

              ),),

            ],
          ),
        ),
      ),

      body: Stack(
        children: <Widget>[
          TopBar(),
          UPDATEuser(id2: id2)
        ],
      )

    );
  }
}

class UPDATEuser extends StatelessWidget {
  const UPDATEuser({
    Key key,
    @required this.id2,
  }) : super(key: key);

  final int id2;

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
                      ti=value;
                      }
                  ),
                ),
                    SizedBox(
                      height: 60,
                    ),

                     Text("Description",style: TextStyle(
                       fontFamily: "Casual",
                       fontSize: 28,
                       fontWeight: FontWeight.bold,

                     ),),
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: TextField(
                        controller: txt2,

                        onChanged: (value){
                          d=value;
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
                    child: Text("Update"),
                    onPressed: ()async {
                      var db=new DataBaseHelper();
                      User updating=User.fromMap({
                        "username":txt1.text,
                        "description":txt2.text,
                        "id":id2
                      }
                      );
                      await db.updateuser(updating);
                      txt1.clear();
                      txt2.clear();
                      Navigator.pop(context);



                    },
                  ),
                )
        ]
        ),
            ),
          )
    );
  }
}
