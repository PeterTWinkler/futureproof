import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';
import 'package:futureproof/screens/form_farmer_screen.dart';
import 'package:futureproof/screens/form_worker_screen.dart';

//This Map will be filled and saved.
Map<String, dynamic> formData = {
  //Collected on root page.
  'email': null,
  'isFarmer': null,
  'occupation': null,
  'isSelfEmployed': null,
  'country': null,
  'settlement': null,
  //Collected on farmer page
  'produce': null,
  'ownLand': null,
  'landTerrain': null,
  'landClimate': null,
  'landInvestment': null,
  //Collected on worker page.
  'occupationDescription': null,
  'skills': null,
  'certificates': null,
};

class FormRootScreen extends StatefulWidget {
  static const id = '/form_root';
  static const displayName = 'Data Form';
  static const collectionID= 'userDataForms';

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

  // The data recorded from the form inputs.

  String _email;
  bool _isFarmer = false; // The current value of CheckboxListTile.

  // This value will be submitted.
  // (_occupationFieldValue will not.)
  String _occupation;
  bool _isSelfEmployed;
  String _country;
  String _settlement;
  int _selfEmployedRadioGroup = 0;

  // _occupation String recovers TextFormField's value when checkbox is
  // changed from true to false. This is not directly submitted
  // to the fromData Map.
  String _occupationFieldValue;

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
                  //Collects email.
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
                              _email = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  //Collects occupation.
                  Container(
                    child: Column(
                      children: [
                        Text('What is your occupation?'),
                        CheckboxListTile(
                          title: Text('I am a farmer'),
                          value: _isFarmer,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isFarmer = newValue;
                              _occupation =
                                  _isFarmer ? 'farmer' : _occupationFieldValue;
                            });
                          },
                        ),
                        Text('or...'),
                        TextFormField(
                          enabled: !_isFarmer,
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _occupation = value;
                              _occupationFieldValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  //Collects isSelfEmployed
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
                                    groupValue: _selfEmployedRadioGroup,
                                    onChanged: (value) {
                                      setState(() {
                                        _isSelfEmployed = true;
                                        _selfEmployedRadioGroup = value;
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
                                    groupValue: _selfEmployedRadioGroup,
                                    onChanged: (value) {
                                      setState(() {
                                        _isSelfEmployed = false;
                                        _selfEmployedRadioGroup = value;
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
                          onChanged: (value) {
                            setState(() {
                              _country = value;
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              _settlement = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  //buttons
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            formData['email'] = _email;
                            formData['isFarmer'] = _isFarmer;
                            formData['occupation'] = _occupation;
                            formData['isSelfEmployed'] = _isSelfEmployed;
                            formData['country'] = _country;
                            formData['settlement'] = _settlement;
                            print(formData);
                            if (_isFarmer) {
                              Navigator.pushNamed(context, FormFarmerScreen.id);
                            } else {
                              Navigator.pushNamed(context, FormWorkerScreen.id);
                            }
                          },
                          child: Text(
                            'Next'.toUpperCase(),
                          ),
                        ),
                      ],
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
