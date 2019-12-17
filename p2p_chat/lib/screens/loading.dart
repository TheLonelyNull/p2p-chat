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
  static bool finished = false;

  @override
  void initState() {
    super.initState();
    _loadingBloc.add(LoadConnection());
  }

  @override
  Widget build(BuildContext topcontext) {
    print("Top context");
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
              print("State:"+state.toString());
              if (state is LoadingInitialState) {
                _animationType = "Searching";
                _loadAnimation = FlareActor(
                  'assets/Connecting.flr',
                  animation: _animationType,
                );
              } else if (state is LoadingSuccessState) {
                //timer pushes next screen after the animation is complete
                //check if success has already happended before to avoid weird repetition glitch
                if (!finished) {
                  finished = true;
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.popAndPushNamed(topcontext, '/home');
                    print("What");
                  });
                  _animationType = "Connected";
                  _loadAnimation = FlareActor(
                    'assets/Connecting.flr',
                    animation: _animationType,
                  );
                }
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
