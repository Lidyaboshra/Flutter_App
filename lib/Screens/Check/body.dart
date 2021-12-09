import 'package:flutter/material.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/Screens/Chat/Chat_Sceen.dart';

class Body extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                RoundedInputField(
                hintText: "Code",
                icon: Icons.check,
                type: TextInputType.number,
                onChanged: (value) {},
                validate:   (value){
                 if(value.isEmpty){
                    return "Please Enter Code";
                    }
                   return null;
                  },
              ),
            
                  SizedBox(
                    height: 30.0,
                  ),
                 
                  RoundedButton(
                    text: "Check",
                    press: () {
                      if(formKey.currentState.validate()){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Chat();
                          },
                        ),
                      );}
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
