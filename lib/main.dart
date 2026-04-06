import 'package:flutter/material.dart';
import 'package:marketi_app/shared/cache_helper.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}



