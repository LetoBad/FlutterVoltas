import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/cronometro_view.dart';
import 'core/viewmodel/cronometro_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CronometroViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronômetro de Voltas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CronometroView(),
    );
  }
}
