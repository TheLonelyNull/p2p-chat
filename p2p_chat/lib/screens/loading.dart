import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import '../bloc/bloc.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  LoadingBloc _loadingBloc = new LoadingBloc();
  static String _animationType = "Searching";
  FlareActor _loadAnimation = FlareActor(
    'assets/Connecting.flr',
    animation: _animationType,
  );

  @override
  void initState() {
    super.initState();
    _loadingBloc.add(LoadConnection());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 62, 67, 91),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          builder: (context) => _loadingBloc,
          child: BlocBuilder(
            bloc: _loadingBloc,
            builder: (BuildContext context, LoadingState state) {
              if (state is LoadingInitialState) {
                _animationType = "Searching";
                _loadAnimation = FlareActor(
                  'assets/Connecting.flr',
                  animation: _animationType,
                );
              } else if (state is LoadingSuccessState) {
                //timer pushes next screen after the animation is complete
                new Timer(const Duration(seconds: 2), () {
                  //todo push and pop to app main screen
                  print("Push new screen");
                });
                _animationType = "Connected";
                _loadAnimation = FlareActor(
                  'assets/Connecting.flr',
                  animation: _animationType,
                );
              } else if (state is LoadingErrorState) {
                _animationType = "Error";
                _loadAnimation = FlareActor(
                  'assets/Connecting.flr',
                  animation: _animationType,
                );
              }
              return _loadAnimation;
            },
          ),
        ),
      )),
    );
  }

  _handleSuccess() {
    print("Done");
  }
}
