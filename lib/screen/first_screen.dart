import 'package:flutter/material.dart';
import 'package:km_test/screen/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    palindromeController.dispose();
    super.dispose();
  }

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(name: nameController.text),
          ),
        );
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

    return Scaffold(
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
    );
  }
}
