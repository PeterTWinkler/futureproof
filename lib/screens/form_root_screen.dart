import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';
import 'package:futureproof/screens/form_farmer_screen.dart';

class FormRootScreen extends StatefulWidget {
  static const id = '/form_root';
  static const displayName = 'Data Form';

  @override
  _FormRootScreenState createState() => _FormRootScreenState();
}

class _FormRootScreenState extends State<FormRootScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  }

  int _radioGroup0 = 0;
  bool _farmerButtonValue = false;
  void _farmerButtonChanged(bool newValue) {
    setState(() {
      _farmerButtonValue = newValue;
    });
  }

  Map formData = {
    //root page
    'email': '',
    'isFarmer': null,
    'occupation': '',
    'selfEmployed': null,
    'country': '',
    'settlement': '',
    //farmer page
    'produce': '',
    'ownLand': null,
    'landTerrain': '',
    'landClimate': '',
    'landInvestment': '',
    //worker page
    'occupationDescription': '',
    'skills': '',
    'certificates': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 64.0,
            ),
            child: Form(
              child: Column(
                children: [
                  //email?
                  Container(
                    child: Column(
                      children: [
                        Text('What is your email address?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                          onChanged: (value) {
                            setState(() {
                              formData['email'] = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  //occupation?
                  Container(
                    child: Column(
                      children: [
                        Text('What is your occupation?'),
                        CheckboxListTile(
                          title: Text('I am a farmer'),
                          value: _farmerButtonValue,
                          onChanged: _farmerButtonChanged,
                        ),
                        Text('or...'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                        ),
                      ],
                    ),
                  ),
                  //self-employed?
                  Container(
                    child: Column(
                      children: [
                        Text('Are you self employed?'),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _radioGroup0,
                                    onChanged: (value) {
                                      setState(() {
                                        _radioGroup0 = value;
                                      });
                                    },
                                  ),
                                  Text('Yes'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _radioGroup0,
                                    onChanged: (value) {
                                      setState(() {
                                        _radioGroup0 = value;
                                      });
                                    },
                                  ),
                                  Text('No'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //country?
                  Container(
                    child: Column(
                      children: [
                        Text('What country are you working in?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                        ),
                      ],
                    ),
                  ),
                  //settlement?
                  Container(
                    child: Column(
                      children: [
                        Text('What city, town, or village are you working in?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FormFarmerScreen.id);
                    },
                    child: Text(
                      'Next'.toUpperCase(),
                    ),
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
