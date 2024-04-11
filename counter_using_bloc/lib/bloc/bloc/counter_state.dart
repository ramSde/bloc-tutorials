part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}
 class IncrementCounterstate extends CounterState{
  int counter;
  IncrementCounterstate({required this.counter});
 }

 class CounterActionState extends CounterState{
  
 }