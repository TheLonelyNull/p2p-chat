import 'dart:async';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {

  @override
  LoadingState get initialState => LoadingInitialState();

  @override
  Stream<LoadingState> mapEventToState(LoadingEvent event) async* {
    if (event is LoadConnection) {
      //todo get the connection state
      //todo connect to network
      await Future.delayed(
          Duration(seconds: 5));
      yield LoadingSuccessState();
    }
  }
}