import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones_assignment/core/configs/theme/app_theme.dart';
import 'package:oruphones_assignment/presentation/auth/bloc/auth_bloc.dart';
import 'package:oruphones_assignment/presentation/home/bloc/home_bloc.dart';
import 'package:oruphones_assignment/presentation/splash/pages/splash.dart';
import 'package:oruphones_assignment/service_locator.dart';

void main() async{
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final homeBloc = HomeBloc();
            homeBloc.add(FetchProducts()); // Trigger fetch here
            homeBloc.add(FetchUser()); // Trigger fetch here
            return homeBloc;
          },
        ),
        BlocProvider(create: (_)=>AuthBloc())

      ],
      child: MaterialApp(
        title: 'ORUPhones',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: SplashPage(),
      ),
    );
  }
}


