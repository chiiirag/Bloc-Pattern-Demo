import 'package:bloc/bloc.dart';
import 'package:block_statemanagement_demo/bloc/counter_demo/counter_events.dart';
import 'package:block_statemanagement_demo/bloc/counter_demo/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter events, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.count + 1));
  }

  void _decrement(DecrementCounter events, Emitter<CounterState> emit) {
    if (state.count <= 0) {
      return;
    }
    emit(state.copyWith(counter: state.count - 1));
  }
}
