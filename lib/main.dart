import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'application.dart';
import 'firebase_options.dart';
import 'initialize.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // アプリ実行前の初期化処理
  await Initialize().init();
  // アプリ実行
  runApp(const ProviderScope(child: Application()));
}
