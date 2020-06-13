import 'package:flutter/material.dart';
import 'package:flutterappt/constants/colors.dart';

import 'Memeber.dart';

class AddMember extends StatefulWidget {
  @override
  _AddMemberState createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  TextEditingController _nameController = TextEditingController();

  /// A private variable for getting the name
  TextEditingController _ageController = TextEditingController();
  List<Member> members = List<Member>(); /// This list holds all added members

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: backgroundColor,
      appBar: returnAppBar(),
      body: Column(
        children: <Widget>[
          returnDataInputtingContainer(),
        ],
      ),
    );
  }

  returnAppBar() {
    return AppBar(
      backgroundColor: primaryPurple,
      title: Text("Members", style: TextStyle(fontSize: 25)),
      centerTitle: true,
    );
  }

  returnDataInputtingContainer() {
    return Column(
      children: <Widget>[
        returnDataField('Name', _nameController),
        returnDataField("Age", _ageController),
        SizedBox(height: 40),
        returnAddMemberButton(),
        SizedBox(height: 40),
        returnListView(),
      ],
    );
  }

  returnDataField(String labelName, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(top: 40, right: 20, left: 20),
      child: Row(
        children: <Widget>[
          Text(
            labelName,
            style: TextStyle(
                color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 30),
          returnTextField(controller),
        ],
      ),
    );
  }

  returnTextField(TextEditingController controller) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 35,
        width: 280,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          controller: controller,
        ),
      ),
    );
  }

  returnAddMemberButton() {
    return GestureDetector(
      onTap: () {
        /// Get the content of both controllers
        String name = _nameController.text;
        String age = _ageController.text;
        /// Clear the content of both controllers for the next entry
        _nameController.clear();
        _ageController.text = "";

        /// The setState function re-renders the application, with the new list,
        /// resulting in the new element displayed in the ListView.
        setState(() {
          members.add(Member(name, age));
        });
      },
      child: Container(
        height: 35,
        width: 300,
        decoration: BoxDecoration(
          color: primaryPurple,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
            child: Text("Add",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ),
    );
  }

  returnListView() {
    return Container(
        height: 300,
        width: 300,
        child: ListView.builder(
            itemCount: members.length, /// This count refers to the length of
            /// the [members] list

            /// This block of logic will get executed as per element in the
            /// [members] list
            itemBuilder: (context, index) {
              return returnMemberCard(members[index]);
            }));
  }

  returnMemberCard(Member member) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Card(
        elevation: 3,
        child: Container(
          height: 60,
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              returnCircle(member.name.substring(0, 1)),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(member.name,
                    style: TextStyle(fontSize: 20, color: textColor)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(member.age,
                    style: TextStyle(fontSize: 20, color: textColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  returnCircle(String letter) {
    double g = 10;
    return Padding(
      padding:  EdgeInsets.only(left: g),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: circleColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(child: Text(letter.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
