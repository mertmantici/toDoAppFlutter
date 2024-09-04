import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/ui/cubit/anasayfa_cubit.dart';
import 'package:todo/ui/cubit/detay_sayfa_cubit.dart';
import 'package:todo/ui/cubit/kayit_sayfa_cubit.dart';
import 'package:todo/ui/views/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => KayitSayfaCubit()),
        BlocProvider(create: (context) => DetaySayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        color: Colors.green,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}
