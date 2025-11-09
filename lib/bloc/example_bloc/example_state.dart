import 'package:equatable/equatable.dart';

abstract class ExampleState extends Equatable{
  const ExampleState();

  @override
  List<Object?> get props => [];
}

class ExampleInitial extends ExampleState {
  const ExampleInitial();
}

class FetchData extends ExampleState {
  const FetchData();
}

class UpdateData extends ExampleState {
  final String data;
  const UpdateData(this.data);
  
  @override
  List<Object?> get props => [data];
}