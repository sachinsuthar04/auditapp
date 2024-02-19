import 'package:auditapp/ui/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.white54,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white54,
        ),
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'Audit App',
      home: const HomeScreen(),
    );
  }
}
