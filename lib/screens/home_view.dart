import 'package:blocapplication/bloc/connectivity_bloc/internet_bloc.dart';
import 'package:blocapplication/bloc/connectivity_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Online! Internet Connected"),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Offline! Internet not Connected"),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Wait! Loading..."),
                backgroundColor: Colors.grey,
              ),
            );
          }
        }, builder: (context, state) {
          if (state is InternetGainedState) {
            return const Text(
              "Your Internet is Connected !",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else if (state is InternetLostState) {
            return const Text(
              " Your Internet is Not Connected !",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return const Text(
              "Loading.....",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          }
        }),
      ),
    ));
  }
}
