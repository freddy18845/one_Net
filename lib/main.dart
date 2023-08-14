import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/services/printing_service.dart';
import 'package:one_net/view_models/store_view_model.dart';
import 'package:one_net/views/loading_screen.dart';
import 'package:one_net/views/splash_screen.dart';
import 'package:provider/provider.dart';

import 'view_models/card_payment_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StoreViewModel>(
          create: (context) => StoreViewModel(),
          lazy: false,
        ),
        ChangeNotifierProvider<CardPaymentViewModel>(
          create: (context) => CardPaymentViewModel(),
          lazy: false,
        ),
        ChangeNotifierProvider<PrintingService>(
          create: (context) => PrintingService(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'One Net',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 122, 13),
          ),
          useMaterial3: true,
          fontFamily: "Gilroy",
        ),
        home: const LoadingScreen(),
      ),
    );
  }
}