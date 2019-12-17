import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoadingEvent extends Equatable {
  LoadingEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadConnection extends LoadingEvent{
  LoadConnection() :super();
}