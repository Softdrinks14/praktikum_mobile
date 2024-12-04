import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:praktikum/app/modules/connection/controller/connection_view.dart';
import 'package:praktikum/app/modules/login/views/login_views.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil instance dari ConnectionController
    final ConnectionController controller = Get.find<ConnectionController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            const Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please check your connection and try again.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Tombol "Coba Lagi"
            ElevatedButton(
              onPressed: () async {
                // Memeriksa status koneksi saat tombol ditekan
                var connectivityResult =
                    await Connectivity().checkConnectivity();

                // Memanggil checkConnection untuk memperbarui status koneksi
                controller.checkConnection(connectivityResult.first);

                // Memberikan feedback kepada pengguna
                if (connectivityResult != ConnectivityResult.none) {
                  // Jika koneksi pulih, tampilkan Snackbar dan arahkan ke halaman login
                  Get.snackbar(
                    "Connected!",
                    "You are now connected to the internet.",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                   Get.offAll(() => LoginView());
                } else {
                  // Jika koneksi gagal, beri tahu pengguna dengan Snackbar
                  Get.snackbar(
                    "Connection Failed",
                    "No internet connection. Please try again.",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
