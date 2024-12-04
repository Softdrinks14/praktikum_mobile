import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    // Memantau perubahan konektivitas
    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      _updateConnectionStatus(connectivityResult.first);
    });
  }

  // Fungsi untuk memperbarui status koneksi
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      // Jika koneksi terputus, tetap di halaman ConnectionPage
      Get.snackbar(
        "Connection Failed",
        "No internet connection. Please try again.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // Get.offAll(() => ConnectionPage());
    } else {
      Get.snackbar(
        "Connected!",
        "You are now connected to the internet.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Jika koneksi pulih, arahkan ke halaman login
      // if (Get.currentRoute == '/connection') {
      //   Get.offAll(() => LoginView());
      // }
    }
  }

  // Fungsi publik untuk memeriksa koneksi
  void checkConnection(ConnectivityResult result) {
    _updateConnectionStatus(result);
  }
}
