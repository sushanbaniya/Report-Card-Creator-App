import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './widgets/drawer.dart';
import './screens/about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
                // fontSizeDelta: 18,
              ),
        ),
        routes: {
          About.routeName: (ctx) => About(),
        });
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _name = '';
  var _roll = '';
  var _sem = '';
  var _year = '';
  var _math = '';
  var _english = '';
  var _chemistry = '';
  var _total = '';
  var _percentage = '';

  final _form = GlobalKey<FormState>();

  void _saveForm() {
    final _isValid = _form.currentState!.validate();
    if (!_isValid) {
      return;
    }
    _form.currentState!.save();
    // var math = double.parse(_math);
    // var english = double.parse(_english);
    // var chemistry = double.parse(_chemistry);

    // _total =( math + english + chemistry).toString();
    // _percentage = (((double.parse(_total)/300) * 100).toStringAsFixed(2)).toString();
  }

  void total() {
    var math = double.parse(_math);
    var english = double.parse(_english);
    var chemistry = double.parse(_chemistry);

    setState(() {
      _total = (math + english + chemistry).toString();
    });

    // print(double.parse(_math));
    // setState(() {
    // _total =  (double.tryParse(_math)! + double.tryParse(_english)! + double.tryParse(_chemistry)!) ? 0 :   (double.parse(_math) + double.parse(_english) + double.parse(_chemistry));

    // });
    // print(_total);
  }

  void percentage() {
    setState(() {
      _percentage =
          (((double.parse(_total) / 300) * 100).toStringAsFixed(2)).toString();
    });
    // setState(() {
    // _percentage = (((double.parse(total.toString())) / 300) * 100);

    // });
    // print(_percentage);
  }

  //  var _total = (double.parse(_math) + double.parse(_english) + double.parse(_chemistry)).toString()  ;
  // var _percentage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title:
            Text('Report Card Creator', style: TextStyle(color: Colors.black)),
      ),
      body: _name.isEmpty
          ? Center(
              child: Stack(children: [
              Column(
                children: [
                  Center(
                      child: FaIcon(
                    FontAwesomeIcons.braille,
                    size: 300,
                    color: Colors.black,
                  )),
                  Center(
                      child: FaIcon(
                    FontAwesomeIcons.braille,
                    size: 300,
                    color: Colors.black,
                  )),
                ],
              ),
              Center(
                child: FaIcon(
                  FontAwesomeIcons.circle,
                  size: 300,
                  color: Colors.black,
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 90),
                    Container(
                      color: Colors.black,
                      child: Text(
                        'Click on Pen to Enter Details ',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    FaIcon(FontAwesomeIcons.arrowDownLong, color: Colors.black, size: 60),
                  ],
                ),
              ),
            ]))
          : Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                height: 250,
                width: 400,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text('ACADEMIA INTERNATIONAL COLLEGE',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 20)),
                        SizedBox(height: 10),
                        FaIcon(FontAwesomeIcons.school,
                            color: Theme.of(context).accentColor, size: 30)
                      ],
                    ),
                    Divider(color: Theme.of(context).accentColor, thickness: 2),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('NAME: ${_name.toUpperCase()}',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                )),
                            Text('YEAR: $_year',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ROLL: $_roll',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                )),
                            Text('SEM: $_sem',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ))
                          ],
                        )
                      ],
                    ),
                    Divider(color: Theme.of(context).accentColor, thickness: 2),
                    // Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    //   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    //     Text('SUBJECTS'),
                    //     Text('FM'),
                    //     Text('PM'),
                    //     Text('OBTAINED MARKS'),
                    //   ],),
                    //   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    //     Text('MATH'),
                    //     Text('100'),
                    //     Text('45'),
                    //     Text('80'),
                    //   ],),
                    //   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('ENG.'),
                    //     Text('100'),
                    //     Text('45'),
                    //     Text('69'),],),
                    //   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    //     Text('CHEM.'),
                    //     Text('100'),
                    //     Text('45'),
                    //     Text('89'),
                    //   ],),
                    // ],)

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('SUBJECT'),
                            SizedBox(height: 10),
                            Text('MATH'),
                            Text('ENGLISH'),
                            Text('CHEMISTRY'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('FM'),
                            SizedBox(height: 10),
                            Text('100'),
                            Text('100'),
                            Text('100'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('PM'),
                            SizedBox(height: 10),
                            Text('45'),
                            Text('45'),
                            Text('45'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('MARKS OBTAINED'),
                            SizedBox(height: 10),
                            Text('$_math'),
                            Text('$_english'),
                            Text('$_chemistry'),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: Theme.of(context).accentColor, thickness: 2),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL: ${_total}',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                )),
                            Text('PERCENTAGE: ${_percentage} %',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ))
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text('DIVISION:',
                        //         style: TextStyle(
                        //             color: Theme.of(context).accentColor,
                        //             fontSize: 20)),
                        //     // Text('SEM:',
                        //     //     style: TextStyle(
                        //     //         color: Theme.of(context).accentColor,
                        //     //         fontSize: 20))
                        //   ],
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.pen),
          onPressed: () {
            showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              context: context,
              builder: (context) => Container(
                // margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border.all(
                      color: Theme.of(context).accentColor,
                      width: 1,
                    )),
                height: MediaQuery.of(context).size.height * 0.97,
                child: Form(
                  key: _form,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                            decoration: InputDecoration(labelText: 'Name'),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            onSaved: (newValue) {
                              setState(() {
                                _name = newValue.toString();
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a name';
                              }
                              return null;
                            }),
                        TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Roll Number',
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              setState(() {
                                _roll = newValue.toString();
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Roll Number';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Enter valid number';
                              }
                              return null;
                            }),
                        TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Semester',
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              setState(() {
                                _sem = newValue.toString();
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Smester';
                              }
                              return null;
                            }),
                        TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Year',
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              setState(() {
                                _year = newValue.toString();
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Year';
                              }
                              if (double.parse(value) < 1 ||
                                  double.parse(value) > 4) {
                                return 'Enter between 1 and 4';
                              }
                              return null;
                            }),
                        TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Marks in Math',
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              setState(() {
                                _math = newValue.toString();
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Marks';
                              }
                              if (double.parse(value) < 0 ||
                                  double.parse(value) > 100) {
                                return 'Enter Marks between 0 and 100';
                              }
                              return null;
                            }),
                        TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Marks in English',
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              setState(() {
                                _english = newValue.toString();
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Marks';
                              }
                              if (double.parse(value) < 0 ||
                                  double.parse(value) > 100) {
                                return 'Enter Marks between 0 and 100';
                              }
                              return null;
                            }),
                        TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Marks in Chemistry',
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              setState(() {
                                _chemistry = newValue.toString();
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Marks';
                              }
                              if (double.parse(value) < 0 ||
                                  double.parse(value) > 100) {
                                return 'Enter Marks between 0 and 100';
                              }
                              return null;
                            }),
                        SizedBox(height: 20),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).primaryColor),
                            child: Text('Create Report Card !'),
                            onPressed: () {
                              _saveForm();
                              total();
                              percentage();
                              // total();
                              // percentage();
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
