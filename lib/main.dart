import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/features/app/pages/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PackageInfo.fromPlatform();

  if (!kReleaseMode) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  await dotenv.load();
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseKey = dotenv.env['SUPABASE_KEY'];

  if (supabaseUrl == null || supabaseKey == null) {
    throw Exception('Supabase URL or Key is missing');
  }

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  injectDependencies();

  runApp(const App());
}
