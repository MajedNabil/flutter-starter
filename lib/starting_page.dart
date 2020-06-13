import 'package:flutter/material.dart';
import 'package:flutterappt/add_members.dart';
import 'package:flutterappt/constants/colors.dart';

/// This class represents the first screen we encounter in the app.

/// Throughout this simple program, we encapsulate each set of Widgets in a
/// simple function.
/// This enables us to degubg the code much better when we encounter a frustrating
/// bug(s)
class StartingPage extends StatefulWidget {
  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    /// [Scaffold] is the 2nd backbone of the application. It's the mother of all
    /// widgets in a screen.
    /// Through its property [body], we can pass the main content of the screen/UI.
    return Scaffold(
      backgroundColor: backgroundColor,

      /// [Center] is the widget that centers its child with respect with its parent
      body: Center(
        /// [Column] is the widget that can house multiple children (i.e., unlike
        /// the Center or the Container), and it displays vertically
        child: Column(
          /// Since [Column] accepts children, it has a children property that
          /// accepts a list of Widgets.
          children: <Widget>[
            /// [Padding] provides a padding for its children
            Padding(
              padding:
                  EdgeInsets.only(top: 100, bottom: 100, right: 30, left: 30),

              /// The [Container] can house only one child.
              child: Container(
                height: 480,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    returnStatement(),
                    returnGetStartedButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  returnStatement() {
    return Text("Welcome to Our New Application",
        style: TextStyle(
            fontSize: 28, color: textColor, fontWeight: FontWeight.bold));
  }

  returnGetStartedButton() {
    return GestureDetector(
      onTap: () {
        print("Hello world!!");

        /// This logic handles the navigation between more than one screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddMember()),
        );
      },
      child: Container(
        height: 65,
        width: 300,
        decoration: BoxDecoration(
          color: primaryPurple,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
            child: Text("Get Started",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ),
    );
  }
}
