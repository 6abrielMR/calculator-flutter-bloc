import 'package:calculator_bloc/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_bloc/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<CalculatorBloc>(create: (_) => CalculatorBloc())
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
