import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoadingState extends Equatable {
  LoadingState([List props = const <dynamic>[]]) : super(props);
}

class LoadingInitialState extends LoadingState{}

class LoadingErrorState extends LoadingState{
  final String errorMessage;

  LoadingErrorState(this.errorMessage) : super([errorMessage]);
}

class LoadingSuccessState extends LoadingState{}