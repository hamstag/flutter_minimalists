import 'package:dio/dio.dart';
import 'package:flutter_minimalists/core/services/local_storage/secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockSecureStorage extends Mock implements SecureStorage {}
