import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter_bloc/bloc/bloc/todo_bloc_bloc.dart';

main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    final todobloc = TodoBlocBloc();
    final editcontroller = TextEditingController();
    final textContrller = TextEditingController();
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: ()  {
                todobloc.add((showdialogevent()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: BlocConsumer<TodoBlocBloc, TodoBlocState>(
        bloc: todobloc,
        buildWhen: (previous, current) => current is !todoactionstate,
        listenWhen: (previous, current) => current is todoactionstate,
        listener: (context, state) {
          if(state is showdialogadddialog){
             showdialogbox(context, textContrller, todobloc);
             
          }

        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data[index]),
                  IconButton(onPressed: () {
                    todobloc.add(edittodoevent(index: index));
                    
                  }, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {
                    todobloc.add(deletetodoevent(index: index));
                  }, icon: Icon(Icons.delete))
                ],
              ),
            );
          });
        },
      ),
    ));
  }

  Future<dynamic> showdialogbox(BuildContext context, TextEditingController textContrller, TodoBlocBloc todobloc) async{
    return  await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        children: [
                          TextField(
                            controller: textContrller,
                            decoration: InputDecoration(hintText: "Title"),
                          ),
                          IconButton(onPressed: () {
                            todobloc.add(addtodoevent(todo: textContrller.text?? "adad"));
                          }, icon: Icon(Icons.done))
                        ],
                      ),
                    );
                  });
  }
}
