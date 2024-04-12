part of 'todo_bloc_bloc.dart';

@immutable
sealed class TodoBlocEvent {}


class addtodoevent extends TodoBlocEvent{
  String todo;
  addtodoevent({required this.todo});
}
class edittodoevent extends TodoBlocEvent{
  int index;
  edittodoevent({required this.index});
}
class deletetodoevent extends TodoBlocEvent{
int index;
  deletetodoevent({required this.index});
}
class showdialogevent extends TodoBlocEvent{
  
}
class getTodoEvent  extends TodoBlocEvent{
  
}