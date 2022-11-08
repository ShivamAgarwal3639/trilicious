import 'dart:developer';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trilicious_social/amplifyconfiguration.dart';
import 'HomePage.dart';
import 'addUserData.dart';
import 'aws_amplify/awsDatastore.dart';
import 'login/loginPage.dart';
import 'models/ModelProvider.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

Future<void> configureAmplify() async {
  final datastorePlugin = AmplifyDataStore(
    modelProvider: ModelProvider.instance,
  );
  final api = AmplifyAPI();
  final auth = AmplifyAuthCognito();
  final storage = AmplifyStorageS3();
  await Amplify.addPlugins([datastorePlugin, api, auth, storage]);
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    log('Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
  }
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
  var id = "";

  @override
  void initState() {
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
            id = user.uid.toString();
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
            ? LandingPage2(
                num: num,
                id: id,
              )
            : const LoginRegisterPage();
  }
}

class LandingPage2 extends StatefulWidget {
  const LandingPage2({Key? key, this.num, this.id}) : super(key: key);
  final num;
  final id;

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
    log(widget.id);
    bool doesExist =
        await AWSAmplifyHelper.instance.readUserExists(id: widget.id);
    if (doesExist) {
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
            : AddUserDataPage(
                id: widget.id,
              );
  }
}
