import 'dart:convert';

import 'package:thanarak_exchange/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseProvider = Provider((ref) => FirebaseService());

class FirebaseService {
  static const stagingPath = 'stag/';
  static const prodPath = 'prod/';

  String path = stagingPath;
  FirebaseStorage? storage;

  Future<void> initStorage() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    storage = FirebaseStorage.instance;
    if (kReleaseMode) {
      path = prodPath;
    }
  }

  Future<void> _checkStorage() async {
    if (storage == null) {
      await initStorage();
    }
  }

  Future<Uint8List?> getCurrencyFile({String? date}) async {
    await _checkStorage();
    final file = await storage
        ?.ref()
        .child(
            '$path/exchange_rate/${date != null ? 'ex_rate_$date' : 'currency_template'}.json')
        .getData();
    return file;
  }

  Future<Uint8List?> getTransactionFile(String? date) async {
    final file = await storage
        ?.ref()
        .child('$path/transaction/transaction_$date.json')
        .getData();
    return file;
  }

  Future<void> saveCurrencyFile(Map<String, dynamic> map, String date) async {
    final saveRef =
        storage?.ref().child('$path/exchange_rate/ex_rate_$date.json');
    saveRef?.putData(utf8.encode(json.encode(map)));
  }

  Future<void> saveTemplateFile(Map<String, dynamic> map) async {
    //todo please determine template by release debug
    final saveRef =
        storage?.ref().child('$path/exchange_rate/currency_template.json');
    saveRef?.putData(utf8.encode(json.encode(map)));
  }

  Future<void> saveTransactionFile(
      Map<String, dynamic> map, String date) async {
    final saveRef =
        storage?.ref().child('$path/transaction/transaction_$date.json');
    saveRef?.putData(utf8.encode(json.encode(map)));
  }
}
