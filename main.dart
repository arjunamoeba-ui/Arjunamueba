
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/db.dart';
import 'src/screens/login.dart';
import 'src/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await AppDatabase.create();
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  final AppDatabase db;
  MyApp({required this.db});
  @override
  Widget build(BuildContext context) {
    return Provider<AppDatabase>.value(
      value: db,
      child: MaterialApp(
        title: 'Penjualan Offline',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginScreen(),
        routes: {
          '/home': (_) => HomeScreen(),
        },
      ),
    );
  }
}
