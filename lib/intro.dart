import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sqltry/main.dart';



class Intro extends StatelessWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle:
    PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
    contentPadding: const EdgeInsets.all(10),
  );


  List<PageViewModel> getPages() {
    return [
      PageViewModel(

        image: Image.asset("images/firstone.png"),
          title: "Notepad",
          body: "This is a superfast, convenient and an easy to use NotePad Application",
          footer: Text(
            "",
            style: TextStyle(color: Colors.black),
          ),
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("images/firstone.png"),
          title: "ADD A NOTE",
          body:"Simple click on the Button on the bottom right corner of the screen to add a note !",
          footer: Text(
            "",
            style: TextStyle(color: Colors.black),
          ),
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("images/firstone.png"),
          title: "DELETE A NOTE",
          body: "Nothing gets easier than this.All you have to do is double tap on the note that you want to Delete !",
          footer: Text(
            "",
            style: TextStyle(color: Colors.black),
          ),
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("images/firstone.png"),
          title: "UPDATE A NOTE",
          body: "All you got to do is tap on the note once to update it !",
          footer: Text(
            "",
            style: TextStyle(color: Colors.black),
          ),
          decoration: pageDecoration)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages:getPages(),
      done: FlatButton(
          color: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(15),
          child: Text("Done",style: TextStyle(color: Colors.orange,fontSize: 20),)),
      onDone: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

      },
    );
  }
}
