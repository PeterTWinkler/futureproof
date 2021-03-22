import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';

class FormFarmerScreen extends StatefulWidget {
  static const id = '/form_farmer';
  static const displayName = 'Data Form (farmer page)';

  @override
  _FormFarmerScreenState createState() => _FormFarmerScreenState();
}

class _FormFarmerScreenState extends State<FormFarmerScreen> {
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
                  // produce?
                  Container(
                    child: Column(
                      children: [
                        Text('What do you produce on your farm?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // own land?
                  Container(
                    child: Column(
                      children: [
                        Text('Do you own the land you work on?'),
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
                  // land terrain?
                  Container(
                    child: Column(
                      children: [
                        Text('What type terrain is your land?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // land climate?
                  Container(
                    child: Column(
                      children: [
                        Text('What climate does your land have?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // land investment?
                  Container(
                    child: Column(
                      children: [
                        Text(
                            'What systems or infrastructure have you invested in for your farm?'),
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
                  //buttons
                  Container(
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Back'.toUpperCase(),
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //Navigator.pushNamed(context, routeName);
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
