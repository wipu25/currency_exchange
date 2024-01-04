// Mocks generated by Mockito 5.4.4 from annotations
// in currency_exchange/test/units/services/history_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i6;

import 'package:currency_exchange/services/firebase_service.dart' as _i2;
import 'package:firebase_storage/firebase_storage.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [FirebaseService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseService extends _i1.Mock implements _i2.FirebaseService {
  @override
  String get path => (super.noSuchMethod(
        Invocation.getter(#path),
        returnValue: _i3.dummyValue<String>(
          this,
          Invocation.getter(#path),
        ),
        returnValueForMissingStub: _i3.dummyValue<String>(
          this,
          Invocation.getter(#path),
        ),
      ) as String);
  @override
  set path(String? _path) => super.noSuchMethod(
        Invocation.setter(
          #path,
          _path,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set storage(_i4.FirebaseStorage? _storage) => super.noSuchMethod(
        Invocation.setter(
          #storage,
          _storage,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<void> initStorage() => (super.noSuchMethod(
        Invocation.method(
          #initStorage,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<_i6.Uint8List?> getCurrencyFile({String? date}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrencyFile,
          [],
          {#date: date},
        ),
        returnValue: _i5.Future<_i6.Uint8List?>.value(),
        returnValueForMissingStub: _i5.Future<_i6.Uint8List?>.value(),
      ) as _i5.Future<_i6.Uint8List?>);
  @override
  _i5.Future<_i6.Uint8List?> getTransactionFile(String? date) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTransactionFile,
          [date],
        ),
        returnValue: _i5.Future<_i6.Uint8List?>.value(),
        returnValueForMissingStub: _i5.Future<_i6.Uint8List?>.value(),
      ) as _i5.Future<_i6.Uint8List?>);
  @override
  _i5.Future<void> saveCurrencyFile(
    Map<String, dynamic>? map,
    String? date,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveCurrencyFile,
          [
            map,
            date,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> saveTemplateFile(Map<String, dynamic>? map) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTemplateFile,
          [map],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> saveTransactionFile(
    Map<String, dynamic>? map,
    String? date,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTransactionFile,
          [
            map,
            date,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}
