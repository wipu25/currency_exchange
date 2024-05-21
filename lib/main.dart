import 'package:currency_exchange/presentation/exchange/exchange_controller.dart';
import 'package:currency_exchange/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  runApp(const ProviderScope(child: CurrencyExchange()));
}

final exchangeProvider =
    ChangeNotifierProvider((ref) => ExchangeController(ref));

class CurrencyExchange extends ConsumerStatefulWidget {
  const CurrencyExchange({super.key});

  @override
  ConsumerState<CurrencyExchange> createState() => _CurrencyExchangeState();
}

class _CurrencyExchangeState extends ConsumerState<CurrencyExchange> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(exchangeProvider).getCurrency();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sapphire Exchange',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
