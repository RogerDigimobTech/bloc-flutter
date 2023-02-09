import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_bloc/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Usando Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (BuildContext context) =>
              LoginBlocBloc(InitialLoginBlocState as LoginBlocState),
          child: const MyHomePage(title: 'flutter demo home page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Usando bloc con login'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18),
            child: BlocBuilder<LoginBlocBloc, LoginBlocState>(
              builder: (context, state) {
                return Form(
                  child: Column(
                    children: [
                      TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Email')),
                      TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true),
                      // ignore: unnecessary_type_check
                      if (state is LoginBlocState)
                        const CircularProgressIndicator()
                      else
                        TextButton(
                            onPressed: _dologin, child: const Text('Login')),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }

  void _dologin() {
    BlocProvider.of<LoginBlocBloc>(context)
        .add(const DoLoginEvent('Email', 'Password'));
  }
}
