import 'package:blocapplication/bloc/connectivity_bloc/internet_bloc.dart';
import 'package:blocapplication/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
        ),
        home: const HomeView(),
      ),
    );
  }
}
