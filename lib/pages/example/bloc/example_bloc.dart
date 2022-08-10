import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleState.initial()) {
    on<ExampleDidLoadEvent>(_handleDidLoad);
  }

  void _handleDidLoad(ExampleDidLoadEvent event, Emitter<ExampleState> emit) {}
}
