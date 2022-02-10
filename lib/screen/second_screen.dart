import 'package:flutter/material.dart';
import 'package:km_test/screen/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    var chooseButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ThirdScreen(),
          ),
        );
      },
      child: const Text('Choose a User'),
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF2B637B),
        minimumSize: const Size.fromHeight(41),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Second Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Center(
              child: Text(
                'Selected User Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                chooseButton,
                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
