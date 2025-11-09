import 'package:bofa_client/bloc/example_bloc/example_event.dart';
import 'package:bofa_client/bloc/example_bloc/example_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Example extends Bloc<ExampleEvent, ExampleState> {
  Example() : super(ExampleInitial()) {
    on<ExampleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}