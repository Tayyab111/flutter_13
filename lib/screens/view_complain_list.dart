import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:user_complaint_app/screens/complain_view_details.dart';

class ViewComplainList extends StatefulWidget {
  const ViewComplainList({Key? key}) : super(key: key);

  @override
  State<ViewComplainList> createState() => _ViewComplainListState();
}

class _ViewComplainListState extends State<ViewComplainList> {
  User? user;
  DatabaseReference? databaseReference;

  @override
  void initState() {
    super.initState();

    user = FirebaseAuth.instance.currentUser;
    databaseReference = FirebaseDatabase.instance
        .reference()
        .child("Complains")
        .child(user!.uid);
    //print(user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4E0E5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      body: Padding(padding: EdgeInsets.all(15.0),
        child: StreamBuilder(
            stream: databaseReference != null ? databaseReference!.onValue : null,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //print(snapshot);
                final data = Map<String, dynamic>.from(
                    (snapshot.data as dynamic).snapshot.value);

                final complainList = [];
                data.forEach((key, value) {
                  //final dataList = Map<String, dynamic>.from(value);
                  complainList.add(Map<String, dynamic>.from(value));
                });

                return ListView.builder(
                    itemCount: complainList.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0xffd2d2d2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplainViewDetails(
                                id: complainList[index]['complainId'],
                                title: complainList[index]['complainTitle'],
                                description: complainList[index]['description'],
                            )));
                          },
                          child: ListTile(
                            title: Text(complainList[index]['complainTitle'], style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),),
                            subtitle: Text(
                                //DateFormat('/*EEEE*/ dd MMM yyyy, HH:mm:ss a')
                                DateFormat('d MMM yyyy, HH:mm:ss a')
                                    .format(DateTime.fromMillisecondsSinceEpoch(
                                    complainList[index]['date']))
                                    .toString(),
                                style: TextStyle(fontSize: 15.0)),
                            trailing: Text(complainList[index]['status'], style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      );

                    });
              } else {
                return Center(
                  child: CircularProgressIndicator()
                );
              }

            }),
      ),

    );
  }
}
