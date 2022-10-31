import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_complaint_app/screens/login.dart';
import 'package:ndialog/ndialog.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscureText = true;
  var passVisibilty = Icon(Icons.visibility_off);

  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var ConfirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD4BEBE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xffD4BEBE),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Color(0xffE4E0E5),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(height: 12.0),
                      TextField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                            hintText: 'Full name',
                            labelText: 'Full Name',
                            fillColor: Color(0xffD2D2D2),
                            filled: true,
                            prefixIcon: Icon(Icons.person),
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
                            )),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            fillColor: Color(0xffD2D2D2),
                            filled: true,
                            prefixIcon: Icon(Icons.email),
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
                            )),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: passwordController,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            fillColor: Color(0xffD2D2D2),
                            filled: true,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = obscureText ? false : true;
                                });
                              },
                              icon: passVisibilty,
                            ),
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
                            )),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: ConfirmpasswordController                                                                                                        ,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            labelText: 'Password',
                            fillColor: Color(0xffD2D2D2),
                            filled: true,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility),
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
                            )),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(5, 5),
                                blurRadius: 7)
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffD2D2D2), Color(0xffD4BEBE)]),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: Size(300.0, 50.0),
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            onSurface: Colors.transparent,
                          ),
                          onPressed: () async {
                            //todo code: signup code
                            var fullName = fullNameController.text.trim();
                            var email = emailController.text.trim();
                            var password = passwordController.text.trim();
                            var confirmPassword = ConfirmpasswordController.text.trim();

                            //progress dialog box
                            ProgressDialog pd = ProgressDialog(
                              context, title: Text('Loading...'),
                              message: Text('Please wait...'),
                            );
                            pd.show();

                            try{
                              if(fullName.isEmpty){
                                pd.dismiss();
                                Fluttertoast.showToast(msg: 'Full name is requred');
                                return;
                              }
                              if(email.isEmpty){
                                pd.dismiss();
                                Fluttertoast.showToast(msg: 'Email is requred');
                                return;
                              }
                              if(password.isEmpty){
                                pd.dismiss();
                                Fluttertoast.showToast(msg: 'Password is requred');
                                return;
                              }
                              if(confirmPassword.isEmpty){
                                pd.dismiss();
                                Fluttertoast.showToast(msg: 'Confirm password is requred');
                                return;
                              }
                              if(password.length < 6){
                                pd.dismiss();
                                Fluttertoast.showToast(msg: 'Atleast 6 characters are requred');
                                return;
                              }
                              if(password != confirmPassword){
                                pd.dismiss();
                                Fluttertoast.showToast(msg: "Passwords don't match");
                                return;
                              }

                              //request code to firebase authentication
                              FirebaseAuth authentication = FirebaseAuth.instance;
                              UserCredential userCredential = await authentication
                                  .createUserWithEmailAndPassword(
                                  email: email,
                                  password: password
                              );
                              if(userCredential != null){
                                //storing user info
                                String uid = userCredential.user!.uid;
                                int date = DateTime.now().millisecondsSinceEpoch;

                                DatabaseReference databaseReference = FirebaseDatabase
                                    .instance
                                  .reference()
                                  .child('users')
                                  .child(uid);
                                await databaseReference.set({
                                  "userId": uid,
                                  "fullName" : fullName,
                                  "email" : email,
                                  "date" : date,
                                });

                                pd.dismiss();
                                Fluttertoast.showToast(msg: 'Successfully Registred');
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return LoginPage();
                                }));
                              }
                            } on FirebaseAuthException catch (e){
                              pd.dismiss();
                              if(e.code == 'email-already-exists'){
                                Fluttertoast.showToast(msg: 'Email already exists, please try another.');
                              }
                            }
                            catch (e){
                              pd.dismiss();
                              Fluttertoast.showToast(msg: 'Email already exists, please try another...');
                            }


                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Alredy Have An Acount ?',
                            style: TextStyle(fontSize: 17.0),
                          ),
                          SizedBox(
                            width: 11.0,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                            child: Text('Sign In Here'),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
