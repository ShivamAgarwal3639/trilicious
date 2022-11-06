import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Myhome.dart';
import 'addUserData.dart';
import 'login/loginPage.dart';


Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor colorCustom = MaterialColor(0xffFFA800, color);


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trilicious',
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: const LandingPage(),
    );
  }
}


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var i = 0;
  var num = "";

  @override
  void initState() {
    // TODO: implement initState
    getUserInstance();
    super.initState();
  }

  getUserInstance() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (mounted) {
          setState(() {
            i = -1;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            num = user.phoneNumber!.substring(3, 13);
            i = 1;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return i == 0
        ? const Scaffold(
      body: SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    )
        : i == 1
        ? LandingPage2(num: num)
        : const LoginRegisterPage();
  }
}

class LandingPage2 extends StatefulWidget {
  const LandingPage2({Key? key, this.num}) : super(key: key);
  final num;

  @override
  _LandingPage2State createState() => _LandingPage2State();
}

class _LandingPage2State extends State<LandingPage2> {
  bool docExists = true;
  int i = 0;

  @override
  void initState() {
    getUserInstance();
    super.initState();
  }

  getUserInstance() async {
    var collection = FirebaseFirestore.instance.collection('user');
    var docSnapshot = await collection.doc(widget.num).get();
    if (docSnapshot.exists) {
      if (mounted) {
        setState(() {
          docExists = true;
          i = 2;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          docExists = false;
          i = 2;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return i == 0
        ? const Scaffold(
      body: SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    )
        : docExists
        ? const HomePage()
        : const AddUserDataPage();
  }
}