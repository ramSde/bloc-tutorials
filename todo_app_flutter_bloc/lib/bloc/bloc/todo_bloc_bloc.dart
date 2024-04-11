import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'todo_bloc_event.dart';
part 'todo_bloc_state.dart';
List<String> data = [];
class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  
  TodoBlocBloc() : super(TodoBlocInitial()) {
    on<TodoBlocEvent>((event, emit) {
    
    });
    on<addtodoevent>((event, emit) => addnewtodo(event.todo),);
    on<edittodoevent>((event, emit) => edittodo(event.index),);
    on<deletetodoevent>((event,emit)=> deletetodo(event.index));
    on<showdialogevent>((event, emit) => emit(showdialogadddialog()),);
  }
  
  addnewtodo(String todo) { 
    data.add(todo);
    emit(addNewtodostate());

  }
  
  edittodo(int index) {
    data[index]= "ram";
    emit(edittodostate());
  }
  
  deletetodo(int index) {
    data.removeAt(index);
    emit(deletetodostate());
  }

}
