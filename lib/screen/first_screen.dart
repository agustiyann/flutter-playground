import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_test/routes/route_name.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();
  final firstC = Get.put(FirstController());

  @override
  Widget build(BuildContext context) {
    var nameTextField = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        cursorColor: Colors.black,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Name',
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        ),
        controller: nameController,
      ),
    );

    var palindromeTextField = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        cursorColor: Colors.black,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Palindrome',
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        ),
        controller: palindromeController,
      ),
    );

    bool isPalindrome(String text) {
      String? original = text.replaceAll(' ', '');
      String? reverse = text.replaceAll(' ', '').split('').reversed.join('');
      return original == reverse;
    }

    var checkButton = ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the that user has entered by using the
              // TextEditingController.
              content: Text(isPalindrome(palindromeController.text)
                  ? "is Palindrome"
                  : "not Palindrome"),
            );
          },
        );
      },
      child: const Text('CHECK'),
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF2B637B),
        minimumSize: const Size.fromHeight(41),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );

    var nextButton = ElevatedButton(
      onPressed: () {
        Get.toNamed(RouteName.secondScreen, arguments: nameController.text);
      },
      child: const Text('NEXT'),
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF2B637B),
        minimumSize: const Size.fromHeight(41),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );

    return GetBuilder<FirstController>(
      dispose: (_) {
        nameController.dispose();
        palindromeController.dispose();
        print('dispose');
      },
      builder: (_) => Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/btn_add_photo.png',
                  width: 116,
                  height: 116,
                ),
                const SizedBox(height: 58),
                nameTextField,
                const SizedBox(height: 22),
                palindromeTextField,
                const SizedBox(height: 45),
                checkButton,
                const SizedBox(height: 15),
                nextButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirstController extends GetxController {}
