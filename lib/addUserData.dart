// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as dev;

import 'HomePage.dart';
import 'Myhome.dart';


class AddUserDataPage extends StatefulWidget {
  const AddUserDataPage({Key? key}) : super(key: key);

  @override
  State<AddUserDataPage> createState() => _AddUserDataPageState();
}

class _AddUserDataPageState extends State<AddUserDataPage> {

  var name = "";
  var age = "";
  var mail = "";
  var gender = "";
  var pic = 'male-1';
  var num = "";
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  initState() {
    super.initState();
    getInitialData();
    // var list = getName("Shivam Agarwal ");
    // dev.log(list.toString());
  }

  getInitialData() {
    final User? user = auth.currentUser;
    final uid = user!.phoneNumber;
    if (mounted) {
      setState(() {
        num = uid!.substring(3, 13);
      });
    }
  }

  List getName(str) {
    var arr = [];
    var arrStr = "";
    arr.add(arrStr);
    for (int i = 0; i < str.length; i++) {
      arrStr = arrStr + str[i];
      arr.add(arrStr.toLowerCase());
    }
    return arr;
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var collectionRef = FirebaseFirestore.instance.collection('user');
      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 52,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 65,
                          width: (2.59 * 65),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: const DecorationImage(
                                image: AssetImage('assets/logo.png'),
                              ),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 52,
                  ),
                  Text(
                    'Name',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        height: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name Field Can\'t be empty';
                      } else if (value.contains(",") ||
                          value.contains(".") ||
                          value.contains("-")) {
                        return 'Name Field Should not contain , . -';
                      }
                      return null;
                    },
                    cursorColor: Color(0xffFFA800),
                    keyboardType: TextInputType.text,
                    onChanged: (str) {
                      if (mounted) {
                        setState(() {
                          name = str;
                        });
                      }
                    },
                    autofocus: true,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Enter full name',
                      hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xffFFA800),
                          )),

                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Text(
                    'DOB',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        height: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'DOB Field Can\'t be empty';
                      } else if (value.contains(",") ||
                          value.contains(".") ||
                          value.contains("-")) {
                        return 'Name Field Should not contain , . -';
                      }
                      return null;
                    },
                    cursorColor: Color(0xffFFA800),
                    keyboardType: TextInputType.datetime,
                    onChanged: (str) {
                      if (mounted) {
                        setState(() {
                          age = str;
                        });
                      }
                    },
                    autofocus: true,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'DD/MM/YYYY',
                      hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xffFFA800),
                          )),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                      LengthLimitingTextInputFormatter(10),
                      CustomDateTextFormatter(),
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Text(
                    'Email',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        height: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email Field Can\'t be empty';
                      } else if (!value.contains('@') || !value.contains('.')) {
                        return 'Please Enter Valid Email Id';
                      }
                      return null;
                    },
                    cursorColor: Color(0xffFFA800),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (str) {
                      if (mounted) {
                        setState(() {
                          mail = str;
                        });
                      }
                    },
                    autofocus: true,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Enter your Email',
                      hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xffFFA800),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 54,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(num.toString())
                                  .set({
                                'number': num,
                                'avatar': '',
                                'dob': age,
                                'name': name,
                                'email': mail,
                                'date': Timestamp.now(),
                                'locationLatData': 0,
                                'locationLongData': 0,
                                'block': false,
                              }, SetOptions(merge: true));
                            } catch (e) {
                              dev.log(e.toString());
                            } finally {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                      (Route<dynamic> route) => false);
                            }
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFFA800),
                              borderRadius: BorderRadius.circular(40.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 46, vertical: 16),
                            child: Text(
                              "Done",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  height: 1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class CustomDateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/', oldValue);
    return newValue.copyWith(
        text: text, selection: _updateCursorPosition(text, oldValue));
  }
}

String _format(String value, String seperator, TextEditingValue old) {
  var finalString = '';
  var dd = '';
  var mm = '';
  var yyy = '';
  var oldVal = old.text;
  print('<------------------------- start---------------------------->');
  print('oldVal -> $oldVal');
  print('value -> $value');
  var temp_oldVal = oldVal;
  var temp_value = value;
  if (!oldVal.contains(seperator) ||
      oldVal.isEmpty ||
      seperator.allMatches(oldVal).length < 2) {
    oldVal += '///';
  }
  if (!value.contains(seperator) || _backSlashCount(value) < 2) {
    value += '///';
  }
  var splitArrOLD = oldVal.split(seperator);
  var splitArrNEW = value.split(seperator);
  print('----> splitArrOLD: $splitArrOLD');
  print('----> splitArrNEW: $splitArrNEW');
  for (var i = 0; i < 3; i++) {
    splitArrOLD[i] = splitArrOLD[i].toString().trim();
    splitArrNEW[i] = splitArrNEW[i].toString().trim();
  }
  // block erasing
  if ((splitArrOLD[0].isNotEmpty &&
      splitArrOLD[2].isNotEmpty &&
      splitArrOLD[1].isEmpty &&
      temp_value.length < temp_oldVal.length &&
      splitArrOLD[0] == splitArrNEW[0] &&
      splitArrOLD[2].toString().trim() ==
          splitArrNEW[1].toString().trim()) ||
      (_backSlashCount(temp_oldVal) > _backSlashCount(temp_value) &&
          splitArrNEW[1].length > 2) ||
      (splitArrNEW[0].length > 2 && _backSlashCount(temp_oldVal) == 1) ||
      (_backSlashCount(temp_oldVal) == 2 &&
          _backSlashCount(temp_value) == 1 &&
          splitArrNEW[0].length > splitArrOLD[0].length)) {
    finalString = temp_oldVal; // making the old date as it is
    print('blocked finalString : $finalString ');
  } else {
    if (splitArrNEW[0].length > splitArrOLD[0].length) {
      if (splitArrNEW[0].length < 3) {
        dd = splitArrNEW[0];
      } else {
        for (var i = 0; i < 2; i++) {
          dd += splitArrNEW[0][i];
        }
      }
      if (dd.length == 2 && !dd.contains(seperator)) {
        dd += seperator;
      }
    } else if (splitArrNEW[0].length == splitArrOLD[0].length) {
      print('splitArrNEW[0].length == 2');
      if (oldVal.length > value.length && splitArrNEW[1].isEmpty) {
        dd = splitArrNEW[0];
      } else {
        dd = splitArrNEW[0] + seperator;
      }
    } else if (splitArrNEW[0].length < splitArrOLD[0].length) {
      print('splitArrNEW[0].length < splitArrOLD[0].length');
      if (oldVal.length > value.length &&
          splitArrNEW[1].isEmpty &&
          splitArrNEW[0].isNotEmpty) {
        dd = splitArrNEW[0];
      } else if (temp_oldVal.length > temp_value.length &&
          splitArrNEW[0].isEmpty &&
          _backSlashCount(temp_value) == 2) {
        dd += seperator;
      } else {
        if (splitArrNEW[0].isNotEmpty) {
          dd = splitArrNEW[0] + seperator;
        }
      }
    }
    print('dd value --> $dd');

    if (dd.isNotEmpty) {
      finalString = dd;
      if (dd.length == 2 &&
          !dd.contains(seperator) &&
          oldVal.length < value.length &&
          splitArrNEW[1].isNotEmpty) {
        if (seperator.allMatches(dd).isEmpty) {
          finalString += seperator;
        }
      } else if (splitArrNEW[2].isNotEmpty &&
          splitArrNEW[1].isEmpty &&
          temp_oldVal.length > temp_value.length) {
        if (seperator.allMatches(dd).isEmpty) {
          finalString += seperator;
        }
      } else if (oldVal.length < value.length &&
          (splitArrNEW[1].isNotEmpty || splitArrNEW[2].isNotEmpty)) {
        if (seperator.allMatches(dd).isEmpty) {
          finalString += seperator;
        }
      }
    } else if (_backSlashCount(temp_oldVal) == 2 && splitArrNEW[1].isNotEmpty) {
      dd += seperator;
    }
    print('finalString after dd=> $finalString');
    if (splitArrNEW[0].length == 3 && splitArrOLD[1].isEmpty) {
      mm = splitArrNEW[0][2];
    }

    if (splitArrNEW[1].length > splitArrOLD[1].length) {
      print('splitArrNEW[1].length > splitArrOLD[1].length');
      if (splitArrNEW[1].length < 3) {
        mm = splitArrNEW[1];
      } else {
        for (var i = 0; i < 2; i++) {
          mm += splitArrNEW[1][i];
        }
      }
      if (mm.length == 2 && !mm.contains(seperator)) {
        mm += seperator;
      }
    } else if (splitArrNEW[1].length == splitArrOLD[1].length) {
      print('splitArrNEW[1].length = splitArrOLD[1].length');
      if (splitArrNEW[1].isNotEmpty) {
        mm = splitArrNEW[1];
      }
    } else if (splitArrNEW[1].length < splitArrOLD[1].length) {
      print('splitArrNEW[1].length < splitArrOLD[1].length');
      if (splitArrNEW[1].isNotEmpty) {
        mm = splitArrNEW[1] + seperator;
      }
    }
    print('mm value --> $mm');

    if (mm.isNotEmpty) {
      finalString += mm;
      if (mm.length == 2 && !mm.contains(seperator)) {
        if (temp_oldVal.length < temp_value.length) {
          finalString += seperator;
        }
      }
    }
    print('finalString after mm=> $finalString');
    if (splitArrNEW[1].length == 3 && splitArrOLD[2].isEmpty) {
      yyy = splitArrNEW[1][2];
    }

    if (splitArrNEW[2].length > splitArrOLD[2].length) {
      print('splitArrNEW[2].length > splitArrOLD[2].length');
      if (splitArrNEW[2].length < 5) {
        yyy = splitArrNEW[2];
      } else {
        for (var i = 0; i < 4; i++) {
          yyy += splitArrNEW[2][i];
        }
      }
    } else if (splitArrNEW[2].length == splitArrOLD[2].length) {
      print('splitArrNEW[2].length == splitArrOLD[2].length');
      if (splitArrNEW[2].isNotEmpty) {
        yyy = splitArrNEW[2];
      }
    } else if (splitArrNEW[2].length < splitArrOLD[2].length) {
      print('splitArrNEW[2].length < splitArrOLD[2].length');
      yyy = splitArrNEW[2];
    }
    print('yyy value --> $yyy');

    if (yyy.isNotEmpty) {
      if (_backSlashCount(finalString) < 2) {
        if (splitArrNEW[0].isEmpty && splitArrNEW[1].isEmpty) {
          finalString = seperator + seperator + yyy;
        } else {
          finalString = finalString + seperator + yyy;
        }
      } else {
        finalString += yyy;
      }
    } else {
      if (_backSlashCount(finalString) > 1 && oldVal.length > value.length) {
        var valueUpdate = finalString.split(seperator);
        finalString = valueUpdate[0] + seperator + valueUpdate[1];
      }
    }

    print('finalString after yyyy=> $finalString');
  }

  print('<------------------------- finish---------------------------->');

  return finalString;
}

TextSelection _updateCursorPosition(String text, TextEditingValue oldValue) {
  var endOffset = max(
    oldValue.text.length - oldValue.selection.end,
    0,
  );
  var selectionEnd = text.length - endOffset;
  print('My log ---> $selectionEnd');
  return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
}

int _backSlashCount(String value) {
  return '/'.allMatches(value).length;
}
