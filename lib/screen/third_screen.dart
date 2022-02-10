import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xFFE2E3E4)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 18),
                Container(
                  width: 49,
                  height: 49,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/background.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      entries[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      entries[index],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
