import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoalStorageRepository{
  // Create storage
  final storage = FlutterSecureStorage();

  Future<String?> getstoredValue(String key) async{
    try{
      return await storage.read(key: key);
    }
    catch (error){
      return null;
    }
  }

  Future<void> storeValue(String key, String value) async{
    try{
      await storage.write(key: key, value: value.toString());
    }
    catch(error){
      return;
    }
  }
}