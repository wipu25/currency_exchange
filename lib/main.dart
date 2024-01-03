import 'package:currency_exchange/presentation/exchange/exchange_controller.dart';
import 'package:currency_exchange/services/currency_list_service.dart';
import 'package:currency_exchange/presentation/home/home_screen.dart';
import 'package:currency_exchange/services/firebase_service.dart';
import 'package:currency_exchange/services/global_widget_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseService>(create: (_) => FirebaseService()),
        ChangeNotifierProvider(create: (_) => GlobalWidgetService()),
        ChangeNotifierProvider(create: (_) => CurrencyListService()),
        ChangeNotifierProvider(
          create: (context) {
            final firebaseService = context.read<FirebaseService>();
            final currencyListService = context.read<CurrencyListService>();
            final currency =
                ExchangeController(firebaseService, currencyListService);
            currency.getCurrency();
            return currency;
          },
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Sapphire Exchange',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
