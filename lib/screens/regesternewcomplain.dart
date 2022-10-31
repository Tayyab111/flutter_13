import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';
import 'package:user_complaint_app/screens/login.dart';
import 'package:user_complaint_app/screens/view_complain_list.dart';

class RegesterNewComplain extends StatefulWidget {
  const RegesterNewComplain({Key? key}) : super(key: key);

  @override
  State<RegesterNewComplain> createState() => _RegesterNewComplainState();
}

class _RegesterNewComplainState extends State<RegesterNewComplain> {
  var complaintController = TextEditingController();
  var fullnameController = TextEditingController();
  var rollnumberController = TextEditingController();
  var mobilenumberController = TextEditingController();
  var hostelnameController = TextEditingController();
  var roomnumberController = TextEditingController();
  var complaintitleController = TextEditingController();

  User? user;
  DatabaseReference? databaseReference;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();

      user = FirebaseAuth.instance.currentUser;
      //databaseReference = FirebaseDatabase.instance.reference();
      print("User Id: ${user!.uid}");
    }

    return Scaffold(
      backgroundColor: Color(0xffE4E0E5),
      appBar: AppBar(
        backgroundColor: Color(0xffE4E0E5),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => LoginPage()));
            },
            icon: Icon(Icons.logout, color: Colors.black),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Regester New Complain',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 21.0,
              ),
              Container(
                child: Column(
                  children: [
                    TextField(
                      controller: fullnameController,
                      decoration: InputDecoration(
                        fillColor: Color(0xffD2D2D2),
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Full Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21.0,
                    ),
                    TextField(
                      controller: rollnumberController,
                      decoration: InputDecoration(
                        fillColor: Color(0xffD2D2D2),
                        filled: true,
                        hintText: 'Roll No',
                        prefixIcon: Icon(Icons.numbers),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: mobilenumberController,
                      decoration: InputDecoration(
                        fillColor: Color(0xffD2D2D2),
                        filled: true,
                        hintText: 'Mobile Number',
                        prefixIcon: Icon(Icons.mobile_off),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21.0,
                    ),
                    TextField(
                      controller: hostelnameController,
                      decoration: InputDecoration(
                        fillColor: Color(0xffD2D2D2),
                        filled: true,
                        hintText: 'Hostel Name',
                        prefixIcon: Icon(Icons.house),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21.0,
                    ),
                    TextField(
                      controller: roomnumberController,
                      decoration: InputDecoration(
                        fillColor: Color(0xffD2D2D2),
                        filled: true,
                        hintText: 'Room No',
                        prefixIcon: Icon(Icons.house),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21.0,
                    ),
                    TextField(
                      controller: complaintitleController,
                      decoration: InputDecoration(
                        fillColor: Color(0xffD2D2D2),
                        filled: true,
                        hintText: 'Complain title',
                        prefixIcon: Icon(Icons.alarm),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      controller: complaintController,
                      decoration: InputDecoration(
                        fillColor: Color(0xffD2D2D2),
                        filled: true,
                        hintText: 'Complain Description',

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            width: 0.0,
                            color: Color(0xffD2D2D2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(5, 5), blurRadius: 7)],
                        borderRadius: BorderRadius.circular(12.0),
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
                        onPressed: () async {
                          var complaintitle = complaintitleController.text.trim();
                          var fullname = fullnameController.text.trim();
                          var rollno = rollnumberController.text.trim();
                          var mobileno = mobilenumberController.text.trim();
                          var roomno = roomnumberController.text.trim();
                          var hostelname =hostelnameController.text.trim();
                          var complainBody =complaintController.text.trim();

                          //Progress start
                          ProgressDialog pd = ProgressDialog(context,
                              title: Text('Loading....'),
                              message: Text('Stay With Us'),);
                              pd.show();

                          if(complainBody.isEmpty){
                            pd.dismiss();
                            Fluttertoast.showToast(msg: 'ComplainBody is required');
                            return;
                          }
                          if(fullname.isEmpty){
                            pd.dismiss();
                            Fluttertoast.showToast(msg: 'Full Name is required');
                            return;
                          }
                          if(rollno.isEmpty){
                            pd.dismiss();
                            Fluttertoast.showToast(msg: 'Roll Number is required');
                            return;
                          }
                          if(mobileno.isEmpty){
                            pd.dismiss();
                            Fluttertoast.showToast(msg: 'Mobile Number is required');
                            return;
                          }
                          if(roomno.isEmpty){
                            pd.dismiss();
                            Fluttertoast.showToast(msg: 'Room Number is required');
                            return;
                          }
                          if(hostelname.isEmpty){
                            pd.dismiss();
                            Fluttertoast.showToast(msg: 'Hostel Name is required');
                            return;
                          }
                          if(complaintitle.isEmpty){
                            pd.dismiss();
                            Fluttertoast.showToast(msg: 'Complain Title is required');
                            return;
                          }
                          /*DatabaseReference taskRef = FirebaseDatabase.instance.reference().child('Tasks');
                          var taskId = taskRef.push().key;
                          await taskRef.child(uid).child(taskId!).set({
                            'taskId' : taskId,
                            'taskName': taskName,
                            'date': dt,
                          });*/

                          //request to firebase to store complain details
                          String uid = FirebaseAuth.instance.currentUser!.uid;
                          DatabaseReference databaseReference = FirebaseDatabase
                              .instance
                              .reference()
                              .child("Complains");
                          var complainId = databaseReference.push().key;
                         // print("complain id: $complainId");
                          int date = DateTime.now().millisecondsSinceEpoch;
                          await databaseReference.child(uid).child(complainId.toString()).set(
                              {
                                'complainId': complainId,
                                'fullName' : fullname,
                                'rollNo' : rollno,
                                'mobileNo' : mobileno,
                                'hostelName': hostelname,
                                'roomNo': roomno,
                                'complainTitle': complaintitle,
                                'description' : complainBody,
                                'date': date,
                                'status': 'Unseen'
                              });
                          pd.dismiss();
                          Fluttertoast.showToast(msg: 'Complain Registered');
                        },
                        child: Text('Regester Complain'),
                      ),
                    ),
                    SizedBox(
                      height: 21.0,
                    ),
                    Container(
                      decoration: BoxDecoration(

                        boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(5, 5), blurRadius: 7)],
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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ViewComplainList()));
                        },
                        child: Text('View Complain'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
