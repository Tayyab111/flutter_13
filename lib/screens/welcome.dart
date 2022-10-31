import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:user_complaint_app/screens/login.dart';
import 'package:user_complaint_app/screens/register.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD4BEBE),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text(
                'Hostel Complaint Management System',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE4E0E5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19.0),
                topRight: Radius.circular(19.0),
              ),
            ),
            child: Column(
              children: [
                Lottie.asset(
                  'assets/image/hello.json',
                  width: 251,
                ),
                SizedBox(
                  height: 21.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    //boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(5, 5), blurRadius: 7)],
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xffD2D2D2), Color(0xffD4BEBE)]),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: Size(300, 50),
                        onPrimary: Colors.black,
                        //textStyle: TextStyle(color: Colors.black),
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        onSurface: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21.0))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      'Create Account',
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                /*Container(
                 decoration: BoxDecoration(
                   //borderRadius: BorderRadius.circular(13.0),
                   border: Border.all(width:1.0 ),
                 ),
                 child:  ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     onPrimary: Colors.black,
                     primary: Colors.transparent,
                     shadowColor: Colors.transparent,
                     onSurface: Colors.transparent,
                   ),
                   onPressed: (){}, child: Text('Log In'),),
               ),*/
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      primary: Colors.black,
                      //shadowColor: Colors.transparent,
                      onSurface: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.0),
                    ))
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
          ),
        ],
      ),
    );
  }
}
