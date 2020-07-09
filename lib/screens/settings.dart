import 'dart:convert';
import 'dart:io';
import 'package:where_is_my_transport/shared/constants.dart';
import 'package:where_is_my_transport/shared/user.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_is_my_transport/authentication/login.dart';
import 'package:http/http.dart' as http;


Future<User> fetchdata() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =prefs.getString(Constants.USER_ID);
    print('this is ${token}');
  
    final response = await http.get(
      Constants.PROFILE,
      headers: {HttpHeaders.authorizationHeader:token},
  );
  final responseJson = json.decode(response.body);

  return User.fromJson(responseJson);
}




class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
   Future<User> futuredata;
  bool lockInBackground = true;
  SharedPreferences prefs;
  void initState() {
    super.initState();
   futuredata=fetchdata();
   
  }

  
  @override
  Widget build(BuildContext context) {
    /*FutureBuilder<User>(
      future: futuredata,
      builder: (context,snapshot){
        if(snapshot.hasData){
          fname=snapshot.data.fname;
          lname=snapshot.data.lname;
          email=snapshot.data.email;
          mobile=snapshot.data.mobile;
          return Text('') ;
        }else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
      }
    );*/
    return Scaffold(
      body: Center(
        child: FutureBuilder<User>(
        future: futuredata,
        builder: (context,snapshot){
          if(snapshot.hasData){
            
            return SettingsList(
          sections: [
           /* SettingsSection(
              title: 'Common',
              tiles: [
                SettingsTile(
                  title: 'Language',
                  subtitle: 'English',
                  leading: Icon(Icons.language),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LanguagesScreen()));
                  },
                ),
                SettingsTile(
                    title: 'Environment',
                    subtitle: 'Production',
                    leading: Icon(Icons.cloud_queue)),
              ],
            ),*/
             SettingsSection(
              title: 'Account',
              tiles: [
                SettingsTile(title: 'Name', leading:Icon(Icons.person),subtitle: "${snapshot.data.fname} ${snapshot.data.lname}",),
                SettingsTile(title: 'Phone number', leading: Icon(Icons.phone),subtitle: snapshot.data.mobile,),
                SettingsTile(title: 'Email', leading: Icon(Icons.email), subtitle: snapshot.data.email,),
                SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app),onTap:() async {
                  prefs = await SharedPreferences.getInstance();
                  setState(() {

                      prefs.setString(Constants.LOGIN_STATUS,"FALSE");
                });
                Navigator.of(context).pushReplacement(
               // the new route
                 MaterialPageRoute(
                      builder: (BuildContext context) => login_page(),
                ),
               );
                },),
              ],
            ),
            SettingsSection(
              title: 'Security',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Lock app in background',
                  leading: Icon(Icons.phonelink_lock),
                  switchValue: lockInBackground,
                  onToggle: (bool value) {
                    setState(() {
                      lockInBackground = value;
                    });
                  },
                ),
                SettingsTile.switchTile(
                    title: 'Use fingerprint',
                    leading: Icon(Icons.fingerprint),
                    onToggle: (bool value) {},
                    switchValue: false),
                SettingsTile.switchTile(
                  title: 'Change password',
                  leading: Icon(Icons.lock),
                  switchValue: true,
                  onToggle: (bool value) {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Misc',
              tiles: [
                SettingsTile(
                    title: 'Terms of Service', leading: Icon(Icons.description)),
                SettingsTile(
                    title: 'Open source licenses',
                    leading: Icon(Icons.collections_bookmark)),
              ],
            )

            
          ],
        ); 
          }else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
        }
    ),
      )
     /* body: SettingsList(
        sections: [
         /* SettingsSection(
            title: 'Common',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
              SettingsTile(
                  title: 'Environment',
                  subtitle: 'Production',
                  leading: Icon(Icons.cloud_queue)),
            ],
          ),*/
           SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(title: 'Phone number', leading: Icon(Icons.phone),subtitle: "${fname}",),
              SettingsTile(title: 'Email', leading: Icon(Icons.email)),
              SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app),onTap:() async {
                prefs = await SharedPreferences.getInstance();
                setState(() {

                    prefs.setString(Constants.LOGIN_STATUS,"FALSE");
              });
              Navigator.of(context).pushReplacement(
             // the new route
               MaterialPageRoute(
                    builder: (BuildContext context) => login_page(),
              ),
             );
              },),
            ],
          ),
          SettingsSection(
            title: 'Security',
            tiles: [
              SettingsTile.switchTile(
                title: 'Lock app in background',
                leading: Icon(Icons.phonelink_lock),
                switchValue: lockInBackground,
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                  title: 'Use fingerprint',
                  leading: Icon(Icons.fingerprint),
                  onToggle: (bool value) {},
                  switchValue: false),
              SettingsTile.switchTile(
                title: 'Change password',
                leading: Icon(Icons.lock),
                switchValue: true,
                onToggle: (bool value) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Open source licenses',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          )

          
        ],
      ),*/
      
    );
  }
}