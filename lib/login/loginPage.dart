import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../main.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final _formKeyNum = GlobalKey<FormState>();

  var num = "";
  var phoneLock = false;

  submit() {
    if (!phoneLock) {
      if (_formKeyNum.currentState!.validate()) {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => LoginRegisterPageOtp(num: num)),
        );
      }
    } else {
      final snackBar = SnackBar(
        content: const Text(
          'Currently, You are ineligible to sign in, Try after sometime.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            // color: Colors.white,
          ),
        ),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Form(
          key: _formKeyNum,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  height: 65,
                  width: (2.59 * 65),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: const DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const Spacer(
                flex: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Please enter your mobile number',
                  style: TextStyle(
                    height: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.length < 10 ||
                        value.contains(" ") ||
                        value.contains(",") ||
                        value.contains(".") ||
                        value.contains("-")) {
                      return 'Please enter valid Number';
                    }
                    return null;
                  },
                  cursorColor: const Color(0xffFFA800),
                  keyboardType: TextInputType.number,
                  onChanged: (str) {
                    if (mounted) {
                      setState(() {
                        num = str;
                      });
                    }
                  },
                  maxLength: 10,
                  autofocus: true,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    prefix: const Text("+91 ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Color(0xffFFA800),
                        )),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.black12),
                    //   borderRadius: BorderRadius.circular(100),
                    // ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Color(0xff4D4C7D)),
                    //   borderRadius: BorderRadius.circular(100),
                    // ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: InkWell(
                  onTap: () {
                    submit();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFA800),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 46, vertical: 16),
                      child: Text(
                        "Request OTP",
                        style: TextStyle(
                          height: 1,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 8,
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.652,
                width: (MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: const DecorationImage(
                        image: AssetImage('assets/login_page_logo.png'),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(12)),
              ),
              const Spacer(
                flex: 2,
              ),
              RichText(
                text: TextSpan(
                  text: 'User ',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.44)),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Dashboard',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.44)),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginRegisterPageOtp extends StatefulWidget {
  const LoginRegisterPageOtp({Key? key, this.num}) : super(key: key);
  final num;

  @override
  State<LoginRegisterPageOtp> createState() => _LoginRegisterPageOtpState();
}

class _LoginRegisterPageOtpState extends State<LoginRegisterPageOtp> {
  final _formKeyNum = GlobalKey<FormState>();

  @override
  initState() {
    loginOtp();
    startPeriodic();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

  var str = "";
  var strOtpTimer = 45;
  String? _verificationId;
  Timer? _timer;
  var index = 0;
  var loading = false;

  startPeriodic() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (strOtpTimer != 0) {
            if (mounted) {
              setState(() {
                strOtpTimer = strOtpTimer - 1;
              });
            }
          }
        });
      }
    });
    if (strOtpTimer == 0) {
      _timer!.cancel();
    }
  }

  loginOtp() async {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 ${widget.num}',
        verificationCompleted: (PhoneAuthCredential credential) {
          log("Completed");
        },
        verificationFailed: (FirebaseAuthException e) {
          log("Failed" + e.toString());
        },
        codeSent: (String verificationId, int? resendToken) async {
          _verificationId = verificationId;
          if (mounted) {
            setState(() {
              _verificationId = verificationId;
            });
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          log("TimeOut");
        },
      );
    } catch (e) {
      log(e.toString());
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  Future<void> _showMyDialogForOtpException(msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          // title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Color(0xff4D4C7D),
                  size: 65,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  msg,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffFFA800),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Text(
                        'Okay',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  codeSent() async {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }
    try {
      AuthCredential _authCredential = PhoneAuthProvider.credential(
          verificationId: _verificationId!, smsCode: num);
      try {
        _firebaseAuth
            .signInWithCredential(_authCredential)
            .then((UserCredential value) async {
          if (value.user != null) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LandingPage()),
                (Route<dynamic> route) => false);
          } else {
            log("Error validating OTP, try again");
          }
        }).catchError((error) {
          if (error.code == 'invalid-verification-code') {
            _showMyDialogForOtpException(
                "Invalid code please enter correct OTP or resend OTP.");
          } else {
            _showMyDialogForOtpException(
                "Some Error occurred Please try again.");
          }
        });
      } on FirebaseAuthException catch (e) {
        log(e.toString());
      }
    } catch (e) {
      log("1" + e.toString());
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  var num = "";
  final FocusNode _pinPutFocusNode = FocusNode();
  final otpCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Form(
          key: _formKeyNum,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  height: 65,
                  width: (2.59 * 65),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: const DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const Spacer(
                flex: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Enter the OTP',
                  style: TextStyle(
                    height: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              // TextFormField(
              //   validator: (value) {
              //     if (value == null ||
              //         value.isEmpty ||
              //         value.length < 6 ||
              //         value.contains(" ") ||
              //         value.contains(",") ||
              //         value.contains(".") ||
              //         value.contains("-")) {
              //       return 'Please enter valid OTP';
              //     }
              //     return null;
              //   },
              //   textAlign: TextAlign.center,
              //   cursorColor: const Color(0xffFFA800),
              //   keyboardType: TextInputType.number,
              //   maxLength: 6,
              //   onChanged: (str) {
              //     if (mounted) {
              //       setState(() {
              //         num = str;
              //       });
              //     }
              //   },
              //   autofocus: true,
              //   style: const TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w500,
              //   ),
              //   decoration: InputDecoration(
              //     isDense: true,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12.0),
              //     ),
              //     //   enabledBorder: OutlineInputBorder(
              //     //     borderSide: BorderSide(color: Colors.black12, width: 2),
              //     //     borderRadius: BorderRadius.circular(100),
              //     //   ),
              //     //   focusedBorder: OutlineInputBorder(
              //     //       borderSide:
              //     //           BorderSide(color: Color(0xff4D4C7D), width: 2),
              //     //       borderRadius: BorderRadius.circular(100)),
              //   ),
              //   inputFormatters: [
              //     FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 24.0),
                  child: Pinput(
                    length: 6,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length < 6 ||
                          value.contains(" ") ||
                          value.contains(",") ||
                          value.contains(".") ||
                          value.contains("-")) {
                        return 'Please enter valid OTP';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (str) {
                      if (mounted) {
                        setState(() {
                          num = str;
                        });
                      }
                    },
                    autofocus: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                    ],
                    focusNode: _pinPutFocusNode,
                    controller: otpCtrl,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: InkWell(
                  onTap: () {
                    if (!loading) {
                      if (_formKeyNum.currentState!.validate()) {
                        codeSent();
                        Future.delayed(const Duration(seconds: 2), () {
                          codeSent();
                        });
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFFA800),
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 46, vertical: 16),
                      child: loading == true
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Submit",
                              style: TextStyle(
                                height: 1,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Didn't you receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              strOtpTimer == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: InkWell(
                        onTap: () {
                          loginOtp();
                          if (mounted) {
                            setState(() {
                              strOtpTimer = 45;
                            });
                          }
                        },
                        child: const Text(
                          "Resend New Code",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFA800),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        "Resend Code in $strOtpTimer Sec",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
              const Spacer(
                flex: 8,
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.652,
                width: (MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: const DecorationImage(
                        image: AssetImage('assets/login_page_logo.png'),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(12)),
              ),
              const Spacer(
                flex: 2,
              ),
              RichText(
                text: TextSpan(
                  text: 'User ',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.44)),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Dashboard',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.44)),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
