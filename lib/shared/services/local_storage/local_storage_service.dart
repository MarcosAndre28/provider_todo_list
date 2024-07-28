import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage_lib;
import 'package:provider_todo_list/shared/errors/local_storage_exceptions.dart';

class LocalStorageService {
  Future<void> set(String key, String? data) async {
    const storage = storage_lib.FlutterSecureStorage();

    try {
      await storage.write(key: key, value: data);
    } catch (error, st) {
      final errorMessage = 'Error storing data: $data with key: $key';
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageExceptions(errorMessage);
    }
  }

  Future<String?> get(String key) async {
    const storage = storage_lib.FlutterSecureStorage();

    try {
      return await storage.read(key: key);
    } catch (error, st) {
      final errorMessage = 'Error reading key: $key';
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageExceptions(errorMessage);
    }
  }

  Future<void> clearStorage(String key) async {
    const storage = storage_lib.FlutterSecureStorage();

    try {
      return await storage.deleteAll();
    } catch (error, st) {
      const  errorMessage = 'Error clearing storage';
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageExceptions(errorMessage);
    }
  }
}
