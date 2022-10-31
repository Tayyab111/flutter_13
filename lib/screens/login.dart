import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';
import 'package:user_complaint_app/screens/forgetPassword.dart';
import 'package:user_complaint_app/screens/regesternewcomplain.dart';
import 'package:user_complaint_app/screens/register.dart';
import 'package:user_complaint_app/screens/view_complain_list.dart';
import 'package:user_complaint_app/screens/welcome.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Welcome()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      backgroundColor: Color(0xffD4BEBE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xffD4BEBE),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Text(
                  'Welcome to Log in Page ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Color(0xffE4E0E5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 25.0),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Email',
                            // labelText: 'Email',
                            filled: true,
                            fillColor: Color(0xffD2D2D2),
                            prefixIcon: Icon(Icons.email),
                            prefixIconColor: Colors.red,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color: Color(0xffD2D2D2),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color: Color(0xffD2D2D2),
                                )),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is requred';
                            } else if (value.length < 6) {
                              return 'Atleast 6 characters are required';
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            // labelText: 'Email',
                            filled: true,
                            fillColor: Color(0xffD2D2D2),
                            prefixIcon: Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color: Color(0xffD2D2D2),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color: Color(0xffD2D2D2),
                                )),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassword()));
                            },
                            child: Text(
                              'Forget password?',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 5.0)
                              ],
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  // stops: [0.5, 0.5],
                                  colors: [
                                    Color(0xffD2D2D2),
                                    Color(0xffD4BEBE)
                                  ])),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size(300, 50),
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent,
                              onSurface: Colors.transparent,
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                var email = emailController.text.trim();
                                var password = passwordController.text.trim();

                                //Progress Dialog Box
                                ProgressDialog pd = ProgressDialog(
                                  context,
                                  title: Text('Loading...'),
                                  message: Text('Stay with us'),
                                );
                                pd.show();

                                try {
                                  /*if(email.isEmpty) {
                                  pd.dismiss();
                                  Fluttertoast.showToast(msg: 'email is Required...');
                                  return;
                                }
                                if(password.isEmpty){
                                  pd.dismiss();
                                  Fluttertoast.showToast(msg: 'password is Required...');
                                  return;
                                }
                                if(password.length < 6){
                                  pd.dismiss();
                                  Fluttertoast.showToast(msg: 'minimum 6 characters Required... ');
                                  return;
                                }*/

                                  //request to firebase for logging in
                                  FirebaseAuth authentication =
                                      FirebaseAuth.instance;
                                  UserCredential userCredential =
                                      await authentication
                                          .signInWithEmailAndPassword(
                                              email: email, password: password);

                                  if (userCredential != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          'Logged in successfully',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      ),
                                    );
                                    //Fluttertoast.showToast(msg: 'Logged in successfully');
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegesterNewComplain()));
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    pd.dismiss();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.redAccent,
                                        content: Text(
                                          'User not found',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      ),
                                    );
                                    Fluttertoast.showToast(
                                        msg: 'User not found');
                                  }
                                  if (e.code == 'wrong-password') {
                                    pd.dismiss();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.redAccent,
                                        content: Text(
                                          'Wrong password',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      ),
                                    );
                                    Fluttertoast.showToast(
                                        msg: 'Wrong password');
                                  }
                                } catch (e) {
                                  pd.dismiss();
                                  Fluttertoast.showToast(
                                      msg: 'Something went wrong');
                                }
                              }
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text('Or continue with...'),
                        SizedBox(height: 20.0),
                        SignInButton(Buttons.google, onPressed: () async {
                          GoogleSignIn googleSignIn = GoogleSignIn();
                          try{
                            var result = await googleSignIn.signIn();
                            if(result != null){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ViewComplainList()));
                            }
                            print(result);
                          }catch (e){
                            print(e);
                          }
                        }),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an acount ?",
                              style: TextStyle(fontSize: 17.0),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
