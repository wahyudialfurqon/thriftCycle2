import 'package:flutter/material.dart';
import 'package:thriftcycle/screens/edit_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   String currentUsername = 'user1234';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 130), 
            const CircleAvatar(
              radius: 65, 
              backgroundImage: AssetImage('image/Profile_Default.png'), 
            ),
            const SizedBox(height: 20),
           Text(
            currentUsername,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
                      const SizedBox(height: 20), 
          ElevatedButton(
          onPressed: () async {
            final updatedUsername = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditProfileScreen(),
              ),
            );
            if (updatedUsername != null) {
              setState(() {
                currentUsername = updatedUsername;
              });
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF2C7C7D),
          ),
          child: const Text('Edit Profile'),
        ),
          ],
        ),
      ),
    );
  }
}
