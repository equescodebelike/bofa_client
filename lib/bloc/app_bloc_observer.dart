import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

/// Custom BlocObserver that logs all BLoC events and state changes
class AppBlocObserver extends BlocObserver {
  final Logger _logger = Logger();

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _logger.i('${bloc.runtimeType} | Event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.i('${bloc.runtimeType} | Change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logger.d(
      '${bloc.runtimeType} | Transition: ${transition.event} -> ${transition.currentState} -> ${transition.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _logger.e('${bloc.runtimeType} | Error: $error\nStackTrace: $stackTrace');
  }
}
