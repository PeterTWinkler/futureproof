import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';

class FormWorkerScreen extends StatefulWidget {
  static const id = '/form_worker';
  static const displayName = 'Data Form (worker page)';

  @override
  _FormWorkerScreenState createState() => _FormWorkerScreenState();
}

class _FormWorkerScreenState extends State<FormWorkerScreen> {
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
                  Container(
                    child: Column(
                      children: [
                        Text('What is your occupation?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('What professional skills do you have?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('What certified qualifications have you acquired?'),
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
