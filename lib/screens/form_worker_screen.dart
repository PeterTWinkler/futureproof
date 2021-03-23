import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';
import 'package:futureproof/screens/form_completed_screen.dart';
import 'package:futureproof/screens/form_root_screen.dart';

class FormWorkerScreen extends StatefulWidget {
  static const id = '/form_worker';
  static const displayName = 'Data Form (worker page)';

  @override
  _FormWorkerScreenState createState() => _FormWorkerScreenState();
}

class _FormWorkerScreenState extends State<FormWorkerScreen> {
  final _firestore = FirebaseFirestore.instance;

  String _occupationDescription;
  String _skills;
  String _certificates;

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
                  // Collects occupationDescription.
                  Container(
                    child: Column(
                      children: [
                        Text('Describe your occupation.'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _occupationDescription = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Collects skills.
                  Container(
                    child: Column(
                      children: [
                        Text('What professional skills do you have?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _skills = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Collects certificates.
                  Container(
                    child: Column(
                      children: [
                        Text(
                            'What certified qualifications have you acquired?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _certificates = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  // Buttons
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            formData['occupationDescription'] = null;
                            formData['skills'] = null;
                            formData['certificates'] = null;
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
                            formData['occupationDescription'] =
                                _occupationDescription;
                            formData['skills'] = _skills;
                            formData['certificates'] = _certificates;
                            print(formData);
                            _firestore
                                .collection(FormRootScreen.collectionID)
                                .add(formData);
                            print('formData sent to Firebase.');
                            Navigator.pushNamed(
                                context, FormCompletedScreen.id);
                          },
                          child: Text(
                            'Submit'.toUpperCase(),
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
