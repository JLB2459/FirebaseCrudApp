import 'package:apiapp/pages/home_page.dart';
import 'package:apiapp/pages/place_page.dart';
import 'package:apiapp/services/place_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ControllState());
}

class ControllState extends StatelessWidget {
  const ControllState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PlaceService(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home_page',
      routes: {
        'home_page': (_) => const HomePage(),
        'place_page': (_) => const PlacePage(),
      },
    );
  }
}
