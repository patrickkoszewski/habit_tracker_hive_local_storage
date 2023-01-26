import 'package:flutter/material.dart';
import 'package:habit_tracker_hive_local_storage/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Own Your Habit\'s'),
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.deepPurple[200],
                      child: const Icon(Icons.person),
                    )),
              ),
            ],
          ),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Go to Login Page'))));
  }
}
