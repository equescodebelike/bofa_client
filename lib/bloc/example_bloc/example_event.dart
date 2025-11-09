import 'package:equatable/equatable.dart';

abstract class ExampleEvent extends Equatable{
  const ExampleEvent();

  @override
  List<Object?> get props => [];

}

class FetchData extends ExampleEvent {
  const FetchData();
}

class UpdateData extends ExampleEvent {
  final String data;
  const UpdateData(this.data);
  
  @override
  List<Object?> get props => [data];
}