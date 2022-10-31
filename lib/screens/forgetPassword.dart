import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:ndialog/ndialog.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4E0E5),
      appBar: AppBar(
        backgroundColor: Color(0xffE4E0E5),
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back, color: Colors.red),),

      ),
     body: Padding(
      padding: EdgeInsets.all(20.0),
       child: Column(
         children: [
           Container(
             //color: Color(0xffE4E0E5),
             alignment: Alignment.center,
             child: Text('Forget Password',
               style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold,),),
           ),
           Container(
             child: Lottie.asset('assets/image/forgetpassword.json'),
             width: 250,
           ),
           SizedBox(height: 21.0,),
           Container(
             child: Column(
               children: [
                 TextField(
                   controller: emailController,
                   decoration: InputDecoration(
                     fillColor: Color(0xffD2D2D2),
                     filled: true,
                     hintText: 'Enter your email',
                     enabledBorder:  OutlineInputBorder(
                       borderRadius: BorderRadius.circular(12.0),
                       borderSide: BorderSide(
                         width: 0.0,
                         color: Color(0xffD2D2D2),
                       ),
                     ),
                     focusedBorder:  OutlineInputBorder(
                       borderRadius: BorderRadius.circular(12.0),
                       borderSide: BorderSide(
                         width: 0.0,
                         color: Color(0xffD2D2D2),
                       ),
                     ),

                   ),
                 ),
                 SizedBox(height: 21.0,),
                 Container(
                   decoration: BoxDecoration(
                     gradient: LinearGradient(
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                       colors: [
                       Color(0xffD2D2D2), Color(0xffD4BEBE),
                     ],)
                   ),
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
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
                       var email = emailController.text.trim();

                       //Prograss Dialog box
                       ProgressDialog pd = ProgressDialog(context,
                           title: Text('Loading ...'),
                           message: Text('Stay with us'),);
                           pd.show();

                       if(email.isEmpty){
                         pd.dismiss();
                         Fluttertoast.showToast(msg: 'Email is requied');
                         return;
                       }

                       try{
                         pd.dismiss();
                         await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                       } on FirebaseAuthException catch(e){
                         Fluttertoast.showToast(msg: 'Email not Sent');
                         pd.dismiss();
                         if(e.code == 'user-not-found'){
                           ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                 backgroundColor: Colors.redAccent,
                                 content: Text('User not found', style: TextStyle(fontSize: 18.0),),
                               ),);
                         }
                       } catch (e){
                         pd.dismiss();
                         ScaffoldMessenger(child: SnackBar(content: Text('Something went wrong')));
                       }
                       
                     }, child: Text('Reset Password'),),
                 ),
                 
               ],
             ),
           ),
         ],
       ),
     ),
    );
  }
}
