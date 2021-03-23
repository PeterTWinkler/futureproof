import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futureproof/components/my_appbar.dart';
import 'package:futureproof/components/my_drawer.dart';
import 'package:futureproof/screens/form_completed_screen.dart';
import 'package:futureproof/screens/form_root_screen.dart';

class FormFarmerScreen extends StatefulWidget {
  static const id = '/form_farmer';
  static const displayName = 'Data Form (farmer page)';

  @override
  _FormFarmerScreenState createState() => _FormFarmerScreenState();
}

class _FormFarmerScreenState extends State<FormFarmerScreen> {
  final _firestore = FirebaseFirestore.instance;

  String _produce;
  bool _ownLand;
  String _landTerrain;
  String _landClimate;
  String _landInvestment;

  int _ownLandRadioGroup = 0;

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
                  // Collects produce.
                  Container(
                    child: Column(
                      children: [
                        Text('What do you produce on your farm?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _produce = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Collects ownLand.
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
                                    groupValue: _ownLandRadioGroup,
                                    onChanged: (value) {
                                      setState(() {
                                        _ownLand = true;
                                        _ownLandRadioGroup = value;
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
                                    groupValue: _ownLandRadioGroup,
                                    onChanged: (value) {
                                      setState(() {
                                        _ownLand = false;
                                        _ownLandRadioGroup = value;
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
                  // Collects landTerrain.
                  Container(
                    child: Column(
                      children: [
                        Text('What type terrain is your land?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _landTerrain = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Collects landClimate.
                  Container(
                    child: Column(
                      children: [
                        Text('What climate does your land have?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _landClimate = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Collects landInvestment.
                  Container(
                    child: Column(
                      children: [
                        Text(
                            'What systems or infrastructure have you invested in for your farm?'),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter data',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _landInvestment = value;
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
                            formData['produce'] = null;
                            formData['ownLand'] = null;
                            formData['landTerrain'] = null;
                            formData['landClimate'] = null;
                            formData['landInvestment'] = null;
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
                            formData['produce'] = _produce;
                            formData['ownLand'] = _ownLand;
                            formData['landTerrain'] = _landTerrain;
                            formData['landClimate'] = _landClimate;
                            formData['landInvestment'] = _landInvestment;
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
