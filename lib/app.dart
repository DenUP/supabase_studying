import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_studying/Registration/bloc/registration_bloc.dart';
import 'package:supabase_studying/RegistrationPage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/': (context) => BlocProvider(
      //         create: (context) => RegistrationBloc(),
      //         child: RegistrationPage(),
      //       ),
      //   '/regist': (context) => const Login(),
      // },
      home: BlocProvider(
        create: (context) => RegistrationBloc(),
        child: RegistrationPage(),
      ),
    );
  }
}
