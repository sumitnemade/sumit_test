import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sumit_test/states/slots_state.dart';

import 'screens/slots_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SlotState()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SlotsScreen(),
    );
  }
}
