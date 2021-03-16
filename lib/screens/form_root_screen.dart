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
  int _radioGroup0 = 0;

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
                  Text('What is your occupation?'),
                  TextButton(
                    onPressed: () {},
                    child: Text('I am a farmer'),
                  ),
                  Text('or...'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter data',
                    ),
                  ),
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
                  Text('What country are you working in?'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter data',
                    ),
                  ),
                  Text('What city, town, or village are you working in?'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter data',
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
