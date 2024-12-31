import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isEditing = false;
  TextEditingController usernameController = TextEditingController();
  String currentUsername = 'user1234';
  bool isUsernameEmpty = false;

  @override
  void initState() {
    super.initState();
    usernameController.text = currentUsername;
  }

  void saveChanges() {
    if (usernameController.text.trim().isEmpty) {
      setState(() {
        isUsernameEmpty = true;
      });
      return;
    }

    setState(() {
      currentUsername = usernameController.text;
      isEditing = false;
      isUsernameEmpty = false;
    });
  }

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
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage('image/Profile_Default.png'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  constraints: const BoxConstraints(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF164041),
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isEditing
                    ? SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isUsernameEmpty ? Colors.red : Colors.grey,
                              ),
                            ),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              color: isUsernameEmpty ? Colors.red : Colors.black,
                            ),
                            errorText: isUsernameEmpty ? 'Username tidak boleh kosong' : null,
                          ),
                        ),
                      )
                    : Text(
                        currentUsername,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                if (!isEditing)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (isEditing) {
                          usernameController.clear();
                        }
                        isEditing = !isEditing;
                      });
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Color(0xFF164041),
                    ),
                    padding: const EdgeInsets.only(left: 8.0),
                    constraints: const BoxConstraints(),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isEditing ? saveChanges : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF2C7C7D),
              ),
              child: const Text('Save Change'),
            ),
          ],
        ),
      ),
    );
  }
}
