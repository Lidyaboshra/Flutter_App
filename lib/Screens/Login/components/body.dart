import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Chat/Chat_Sceen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
   Body({
    Key key,
  }
  ) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
var passwordContoller=TextEditingController();

var emailContoller=TextEditingController();

var formKey=GlobalKey<FormState>();

bool showpass=true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                contoller: emailContoller,
                type:TextInputType.emailAddress ,
                hintText: "Your Email",
                onChanged: (value) {},
                validate:   (value){
                 if(value.isEmpty){
                    return "Please Enter Your Email";
                    }
                   return null;
                  },
                
              ),
              RoundedPasswordField(
                contoller: passwordContoller,
                obscure: showpass,
                ifpressed: (){
                  setState(() {
                    showpass = !showpass;
                  });
                },
                 validate:   (value){
                 if(value.isEmpty){
                    return "Please Enter Your Password";
                    }
                   return null;
                  },
                text: "Password",
                onChanged: (value) {}
              ,
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  if(formKey.currentState.validate()){
                    print(emailContoller.text);
                    print(passwordContoller.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Chat();
                },
              ),);
                }
          
              SizedBox(height: size.height * 0.03);
            
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              );
                    
                  }  ),
              ]),
        ),
    ));
  }
}
