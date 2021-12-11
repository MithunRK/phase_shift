import 'package:flutter/material.dart';
import 'package:foodybite_app/pallete.dart';
import 'package:foodybite_app/widgets/rounded-button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodybite_app/widgets/background-image.dart';

final _firestore = FirebaseFirestore.instance;

class EventRegPage extends StatelessWidget {
  EventRegPage({this.event});

  String name;
  String email;
  String event;
  String sem;
  String dept;
  String usn;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [Colors.black, Colors.transparent],
      ).createShader(rect),
      blendMode: BlendMode.color,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: AssetImage(
              'assets/images/for.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black12.withOpacity(0.4),
            centerTitle: true,
            title: Text("PHASE SHIFT"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Name",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              name = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "USN",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              usn = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Department",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              dept = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Sem",
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              sem = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: event,
                              hintStyle: kBodyText.copyWith(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: kBodyText,
                            onChanged: (value) {
                              event = value;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                        buttonName: 'Register',
                        onPressed: () {
                          _firestore.collection('Eventregister').add({
                            'name': name,
                            'email': email,
                            'usn': usn,
                            'department': dept,
                            'sem': sem,
                            'event': event,
                          });
                        }),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Padding(
// padding: EdgeInsets.symmetric(horizontal: 24.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: <Widget>[
// BackgroundImage(image: 'assets/images/log.jpg'),
// SizedBox(
// height: 48.0,
// ),
// TextField(
// keyboardType: TextInputType.emailAddress,
// textAlign: TextAlign.center,
// onChanged: (value) {
// name = value;
// },
// decoration: kTextFieldDecoration.copyWith(
// hintText: "Name",
// ),
// ),
// SizedBox(
// height: 20.0,
// ),
// TextField(
// keyboardType: TextInputType.emailAddress,
// textAlign: TextAlign.center,
// onChanged: (value) {
// email = value;
// },
// decoration: kTextFieldDecoration.copyWith(
// hintText: "Email",
// ),
// ),
// SizedBox(
// height: 20.0,
// ),
// TextField(
// textAlign: TextAlign.center,
// onChanged: (value) {
// usn = value;
// },
// decoration: kTextFieldDecoration.copyWith(
// hintText: 'USN',
// ),
// ),
// SizedBox(
// height: 20.0,
// ),
// TextField(
// keyboardType: TextInputType.emailAddress,
// textAlign: TextAlign.center,
// onChanged: (value) {
// dept = value;
// },
// decoration: kTextFieldDecoration.copyWith(
// hintText: "Deparment",
// ),
// ),
// SizedBox(
// height: 20.0,
// ),
// TextField(
// keyboardType: TextInputType.emailAddress,
// textAlign: TextAlign.center,
// onChanged: (value) {
// sem = value;
// },
// decoration: kTextFieldDecoration.copyWith(
// hintText: "Sem",
// ),
// ),
// SizedBox(
// height: 20.0,
// ),
// TextField(
// keyboardType: TextInputType.emailAddress,
// textAlign: TextAlign.center,
// onChanged: (value) {
// event = value;
// },
// decoration: kTextFieldDecoration.copyWith(
// hintText: event,
// hintStyle: TextStyle(
// color: Colors.red,
// fontSize: 20.0,
// fontWeight: FontWeight.w600,
// ),
// ),
// ),
// SizedBox(
// height: 20.0,
// ),
// RoundedButton(
// buttonName: 'Register',
// onPressed: () {
// _firestore.collection('Eventregister').add({
// 'name': name,
// 'email': email,
// 'usn': usn,
// 'department': dept,
// 'sem': sem,
// 'event': event,
// });
// }),
// ],
// ),
// ),

//Size size = MediaQuery.of(context).size;
// return Scaffold(
//   appBar: AppBar(
//     title: Center(child: Text("Phase Shift")),
//   ),
//   backgroundColor: Colors.transparent,
//   body:
// );
