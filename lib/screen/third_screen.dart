import 'package:flutter/material.dart';
import 'package:km_test/controllers/third_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreen({Key? key}) : super(key: key);
  final thirdController = Get.put(ThirdController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThirdController>(
      initState: (_) {
        thirdController.getUsers();
      },
      builder: (c) => Scaffold(
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
        body: c.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                itemCount: c.users.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString(
                          'selected-user',
                          c.users[index].firstName! +
                              ' ' +
                              c.users[index].lastName!);
                    },
                    child: Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 0.5, color: Color(0xFFE2E3E4)),
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
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  c.users[index].avatar!,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                c.users[index].firstName! +
                                    ' ' +
                                    c.users[index].lastName!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                c.users[index].email!,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
