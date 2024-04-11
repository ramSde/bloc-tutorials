import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int count =0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      
    });
    on<IncrementcounterEvent>((event, emit) => increment(),);
    on<CounterActionEvent>((event, emit) => action(),);
  }
  
  increment() {

    count++;
    emit(IncrementCounterstate(counter: count));
  }
  
  action() {
emit(CounterActionState());
  }
}
