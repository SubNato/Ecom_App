import 'package:ecom_app/routes/bloc_observer.dart';
import 'package:ecom_app/service/storage_service.dart';
import 'package:flutter/cupertino.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Global{
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    //To test Firebase Connection
    Bloc.observer = MyGlobalObserver();
    await Firebase.initializeApp(
      //Error appeared. The fix was to add the import of Firebase manually.
      //options: DefaultFirebaseOptions.currentPlatform,
    );
    storageService = await StorageService().init();
  }
}