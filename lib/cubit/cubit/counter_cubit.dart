import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increaseCounter() {
    print(state.copyWith(count: state.count + 2));
    emit(state.copyWith(count: state.count + 2));
  }

  void decreaseCounter() {
    emit(state.copyWith(count: state.count - 2));
  }

  void mulCounter() {
    emit(state.copyWith(count: state.count * 2));
  }
}
