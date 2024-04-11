
part of 'todo_bloc_bloc.dart';

@immutable
sealed class TodoBlocState {}

final class TodoBlocInitial extends TodoBlocState {}


class todoactionstate extends TodoBlocState{

}
class showdialogadddialog extends todoactionstate{



}

class addNewtodostate extends TodoBlocState {
  

}
class edittodostate extends TodoBlocState {
 
  
}
class deletetodostate extends TodoBlocState {

  
}
