import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum/app/data/widgets/theme_controller.dart';
import 'package:praktikum/firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'package:praktikum/depention_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inisialisasi ThemeController
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final themeController = Get.put(ThemeController());

  runApp(
    Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData.light(), // Tema Light
        darkTheme: ThemeData.dark(), // Tema Dark
        themeMode: themeController.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light, // Mode tema
      );
    }),
  );
  DependentionInjection.init();
}
