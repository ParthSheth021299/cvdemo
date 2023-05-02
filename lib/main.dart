import 'package:cvdemo/provider/education_detail_provider.dart';
import 'package:cvdemo/provider/personal_detail_provider.dart';
import 'package:cvdemo/screens/home_screen.dart';
import 'package:cvdemo/widgets/simple_pdf_viewer_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('Firebase${Firebase.initializeApp()}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Generate App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {SimpleCvViewer.routeName: (ctx) => const SimpleCvViewer()},
    );
  }
}
