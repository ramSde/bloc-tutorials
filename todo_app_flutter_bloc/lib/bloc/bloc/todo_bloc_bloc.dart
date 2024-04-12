import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'todo_bloc_event.dart';
part 'todo_bloc_state.dart';

List<String> data = [];

class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBlocBloc() : super(TodoBlocInitial()) {
    on<TodoBlocEvent>((event, emit) {});

    on<addtodoevent>((event, emit) => addnewtodo(event.todo));
    on<edittodoevent>((event, emit) => edittodo(event.index));
    on<deletetodoevent>((event, emit) => deletetodo(event.index));
    on<showdialogevent>((event, emit) => emit(showdialogadddialog()));
    on<getTodoEvent>((event, emit) => gettodo());
  }

  addnewtodo(String todo) {
    data.add(todo);
    emit(addNewtodostate());
  }

  edittodo(int index) {
    data[index] = "ram";
    emit(edittodostate());
  }

  deletetodo(int index) {
    data.removeAt(index);
    emit(deletetodostate());
  }

  Future<void> gettodo() async {
    try {
      final dio = Dio();
      final response = await dio.get("https://jsonplaceholder.typicode.com/todos");
      if (response.statusCode == 200) {
        final List<dynamic> todos = response.data;
        data = todos.map((todo) => todo['title'].toString()).toList();
        emit(gettodostate());
      } else {
        // Handle error response
        // emit(TodoErrorState("Failed to load todos"));
      }
    } catch (e) {
      // Handle Dio error
      // emit(TodoErrorState("Failed to fetch todos: $e"));
    }
  }
}
