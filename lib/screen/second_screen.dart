import 'package:flutter/material.dart';
import 'package:km_test/controllers/second_controller.dart';
import 'package:km_test/routes/route_name.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);
  final secondController = Get.put(SecondController());

  @override
  Widget build(BuildContext context) {
    var chooseButton = ElevatedButton(
      onPressed: () {
        Get.toNamed(RouteName.thirdScreen)!.then((value) {
          secondController.loadSelectedUser();
        });
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

    return GetBuilder<SecondController>(
      initState: (_) => secondController.loadSelectedUser(),
      builder: (_) => Scaffold(
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
                    '${Get.arguments}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  secondController.selectedUser,
                  style: const TextStyle(
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
      ),
    );
  }
}
