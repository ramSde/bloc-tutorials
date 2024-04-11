import 'package:counter_using_bloc/bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = CounterBloc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterBloc, CounterState>(
              bloc: counterBloc,
              listenWhen: (previous, current) => current is CounterActionState,
              buildWhen: (previous, current) => current is! CounterActionState,
              listener: (context, state) {
                
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("snackbar")));
                
              },
              builder: (context, state) {
                var successtate = state ;
                if(state.runtimeType == IncrementCounterstate){
 successtate = state as IncrementCounterstate;
                
                
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
             return Text("0");
              }
              
            ),
            TextButton(
                onPressed: () {
                  counterBloc.add(IncrementcounterEvent());
                },
                child: Text("ADD")),
            TextButton(
                onPressed: () {
                  counterBloc.add(CounterActionEvent());
                },
                child: Text("show snackbar")),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
