import 'package:flutter/material.dart';
import 'package:glaucoma_app/UI/SignIn/SignIn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'CustomWidget/colors.dart';
import 'Provider/App_provider.dart';
import 'UI/Detection/patienInformation.dart';
import 'UI/HeroSection/heroSection.dart';
import 'UI/Records/records.dart';
import 'UI/SignUp/SignUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          'signUp': (context) => SignUp(),
          'signIn': (context) => SignIn(),
          'hero': (context) => HeroScreen(),
          'records': (context) => Records(),
          'patientData': (context) => PatientInformation(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: SignIn(),
    );
  }
}
