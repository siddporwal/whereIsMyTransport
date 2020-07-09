import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:where_is_my_transport/authentication/login.dart';
import 'package:where_is_my_transport/shared/constants.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String reply;
  Future<String> apiRequest(String url, Map jsonMap) async {
    try {


      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      var reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      String status = data['status'].toString();

      print('RESPONCE_DATA : ' + status);



      if (status == "1") {
        Fluttertoast.showToast(
            msg: "Successfully Register",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacement(  context,
            new MaterialPageRoute(builder: (BuildContext context) =>login_page() ));
        return reply;
      } else  {
        Fluttertoast.showToast(
            msg: "Try Again, Some Thing Went Wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
      return reply;
    }
  }
  @override
  final _formkey=GlobalKey<FormState>();
  String Fname='';
  String Lname='';
  String mobile='';
  String email='';
  String password='';
  String conpassword='';
  String error='';
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
              key: _formkey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0,0.0,30.0,0.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                          height:100.0,
                          child:Image.asset("assets/logo3.png")
                        ),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (val) => !EmailValidator.validate(val,true)? 'Not a valid email.': null,
                      keyboardType:TextInputType.emailAddress ,

                      onSaved: (value3) {
                        email = value3;
                      },
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),

                      ),
                      keyboardType:TextInputType.text ,

                      onSaved: (value) {
                        Fname= value;
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white


                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      keyboardType:TextInputType.text ,
                      /*onChanged: (val) {
                          setState(() {
                            Lname=val;
                          });
                        }*/
                      onSaved: (value1) {
                        Lname = value1;
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mobile',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      keyboardType:TextInputType.phone ,
                      /*onChanged: (val) {
                          setState(() {
                            mobile=val;
                          });
                        }*/
                      onSaved: (value2) {
                        mobile = value2;
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                      obscureText: true,

                      onSaved: (value4) {
                        password = value4;
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                      obscureText: true,

                      onSaved: (value5) {
                        conpassword = value5;
                      },
                    ),
                  ),
                  SizedBox(height:10),
                  RaisedButton(
                    child: Text('Register'),
                    color:Colors.orange,
                    onPressed: (){
                      if(password==conpassword){
                      if(_formkey.currentState.validate()){
                        _formkey.currentState.save();
                        Map map = {
                          "fname": Fname,
                          "lname": Lname,
                          "mobile": mobile,
                          "email": email,
                          "password": password
                        };
                        apiRequest(Constants.SIGNUP_URL, map);
                      }
                    }
                    },
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
