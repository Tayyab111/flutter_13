import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:user_complaint_app/screens/view_complain_list.dart';

class ComplainViewDetails extends StatefulWidget {
  final id, title, description;

  const ComplainViewDetails(
      {Key? key,
      required this.id,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  State<ComplainViewDetails> createState() => _ComplainViewDetailsState();
}

class _ComplainViewDetailsState extends State<ComplainViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4E0E5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.0),
                Text(
                  '${widget.title}',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color(0xffD2D2D2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    '${widget.description}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(5, 5),
                                blurRadius: 7)
                          ],
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xffD2D2D2),
                              Color(0xffD4BEBE),
                            ],
                          )),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: Size(300, 50),
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          onSurface: Colors.transparent,
                          onPrimary: Colors.black,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: ()  {
                          AlertDialog ad = AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            title: Text('Confirmation'),
                            content: Text('Are you sure?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('No'),
                              ),
                              TextButton(
                                onPressed: () async{
                                  String uid = FirebaseAuth.instance.currentUser!.uid;
                          DatabaseReference databaseReference =
                              FirebaseDatabase.instance.reference().child("Complains")
                          .child(uid).child(widget.id.toString());
                          await databaseReference.remove();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Complain successfully deleted'),));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return ViewComplainList();
                          }));
                                },
                                child: Text('Yes'),
                              ),
                            ],
                          );
                          showDialog(context: context, builder: (ctx) => ad);
                        },
                        child: Text('Delete Complain'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
