import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/Screens/Check/Check.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:url_launcher/url_launcher.dart';


_launchURL() async {
  const url = 'https://www.facebook.com/login/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  get import => null;

var passwordContoller=TextEditingController();

var emailContoller=TextEditingController();

var firstname=TextEditingController();

var lastname=TextEditingController();

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
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              // SvgPicture.asset(
              //  "assets/icons/signup.svg",
              //   height: size.height * 0.35,
              //  ),
        
              RoundedInputField(
                hintText: "First Name",
                contoller: firstname,
                type:TextInputType.name ,

                onChanged: (value) {},
                validate:   (value){
                 if(value.isEmpty){
                    return "Please Enter First Name";
                    }
                   return null;
                  },

              ),
              RoundedInputField(
                hintText: "Last Name",
               contoller: lastname,
              type:TextInputType.name ,
                onChanged: (value) {},
                validate:   (value){
                 if(value.isEmpty){
                    return "Please Enter Your Last Name";
                    }
                   return null;
                  },
              ),
             
        
              RoundedInputField(
                hintText: "Your Email",
                 type:TextInputType.emailAddress ,
                icon: Icons.email,
                onChanged: (value) {},
                contoller: emailContoller,
                validate:   (value){
                 if(value.isEmpty){
                    return "Please Enter Your Email";
                    }
                   return null;
                  },
              ),
        
              RoundedPasswordField(
                text: "Password",
                 obscure: showpass,
                ifpressed: (){
                  setState(() {
                    showpass = !showpass;
                  });
                },
                onChanged: (value) {},
                validate:   (value){
                 if(value.isEmpty){
                    return "Please Enter Your Password";
                    }
                   return null;
                  },
              ),
        
               RoundedPasswordField(
                text: "Confirm Password",
                 obscure: showpass,
                ifpressed: (){
                  setState(() {
                    showpass = !showpass;
                  });
                },
                onChanged: (value) {},
                validate:   (value){
                 if(value.isEmpty){
                    return "Confirm Your Password Please";
                    }
                   return null;
                  },
              ),
        
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  if(formKey.currentState.validate()){
                    print(emailContoller.text);
                    print(passwordContoller.text);
                    print(firstname.text);
                    print(lastname.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Check();
                      },
                    ),
                  );
              }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: _launchURL,
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


