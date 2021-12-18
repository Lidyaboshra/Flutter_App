import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

//For Flask >>>>
//import 'package:http/http.dart' as http;
class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //For Flask >>>>
  String greetings = "";
  String name = ""; //user's response will be assigned to this variable
  String final_response =""; //will be displayed on the screen once we get the data from the server
  final _formkey =
      GlobalKey<FormState>(); //key created to interact with the form

  Future<void> _savingData() async {
    final validation = _formkey.currentState.validate();
    if (!validation) {
      return;
    }
    _formkey.currentState.save();
  }

  OutlineInputBorder _inputformdeco() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide:
          BorderSide(width: 1.0, color: Colors.blue, style: BorderStyle.solid),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),

                  //For Flask >>>>
                  Text(
                    greetings,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xFFE1F5FE),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 7,
                      ),
                      child: Container(
                        child: Form(
                          key: _formkey,
                          child: TextFormField(
                            onChanged: (value) {},
                            onSaved: (value) {
                              name = value;
                            },
                            decoration: InputDecoration(
                              enabledBorder: _inputformdeco(),
                              focusedBorder: _inputformdeco(),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              hintText: 'Write your message here...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimaryColor,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          //For Flask >>>>

                          //   final response = await http.get('http://127.0.0.1:5000/');
                          //   final decode = json.decode(response.body) as Map< string , dynamic>;

                          //  setState(() {
                          //    greetings = decoded['greetings'];
                          //  });
                        },
                        child: Text(
                          'Get',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //for post http
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimaryColor,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          //For Flask >>>>
                          //         final url = 'http://127.0.0.1:5000/name';

                          // //getting data from the python server script and assigning it to response
                          // final response = await http.get(url);

                          // //converting the fetched data from json to key value pair that can be displayed on the screen
                          // final decoded = json.decode(response.body) as Map<String, dynamic>;

                          // //changing the UI be reassigning the fetched data to final response
                          // setState(() {
                          //   final_response = decoded['name'];
                          // });
                        },
                        child: Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //For Flask
                //  Text(final_response, style: TextStyle(fontSize: 24),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
