import 'dart:async';

import 'package:blocapplication/bloc/connectivity_bloc/internet_event.dart';
import 'package:blocapplication/bloc/connectivity_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InterntEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitysubscription;

  InternetBloc() : super(InitialState()) {
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));

    connectivitysubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitysubscription?.cancel();
    return super.close();
  }
}
