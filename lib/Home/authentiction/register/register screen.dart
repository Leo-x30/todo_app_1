import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test1/Home/authentiction/register/custom%20text%20form%20field.dart';

class RegisterScreen extends StatelessWidget {

  static const String routename = 'register screen';
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController comfirmpasswordcontroller = TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Create account'),
       centerTitle: true,
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Form(key: formkey,
             child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               CustomTextFormFiled(
                   label: 'user name'
                 ,controller:namecontroller,
                 myValidator: (text){
                     if (text == null||text.trim().isEmpty){
                       return "please enter username";
                     }
                     return null;
                 },
               ),
               CustomTextFormFiled(
                   label: 'email',
                 controller: emailcontroller,
                 myValidator: (text){
                 if (text == null||text.trim().isEmpty){
                   return "please enter email";
                 }
                 final bool emailValid =
                 RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                     .hasMatch(text);
                 if(!emailValid){
                   return 'please enter valid email';
                 }
                 return null;
                 },
                 keyboardType: TextInputType.emailAddress,
               ),
               CustomTextFormFiled(
                   label: 'Password'
                 ,controller: passwordcontroller,
                 myValidator: (text){
                 if (text == null||text.trim().isEmpty){
                   return "please enter password";
                 }
                 if(text.length<6){
                   return 'password must be atleast 6 charcters';
                 }
                 return null;
               },keyboardType: TextInputType.number,
                 obscureText: true,
               ),

               CustomTextFormFiled(
                   label: 'confirm password'
                 ,controller: comfirmpasswordcontroller,
                 myValidator: (text){
                 if (text == null||text.trim().isEmpty){
                   return "please confirmpassword";
                 }if(text.length<6){
                   return 'password must be atleast 6 charcters';
                 }
                 if(text !=passwordcontroller.text){
                   return "password doesn't match";
                 }
                 return null;
               },keyboardType: TextInputType.number,
                 obscureText: true,


               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(onPressed: () {
                   register();
                 },
                 child: Text('Create account'),

                 ),
               )
              ],
             )
           )
         ],
       ),
     ),
   );
  }

  void register() async{
    if(formkey.currentState?.validate()==true){
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
