// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit.dart';

class CounterState {
  final int count;
  CounterState({
    required this.count,
  });

  @override
  bool operator ==(covariant CounterState other) {
    if (identical(this, other)) return true;

    return other.count == count;
  }

  factory CounterState.initial() {
    return CounterState(count: 10);
  }

  @override
  int get hashCode => count.hashCode;

  @override
  String toString() => 'CounterState(count: $count)';

  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }
}
