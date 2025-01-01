import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final String initialUsername;
  final File? initialProfileImage;

  const EditProfileScreen({
    Key? key,  
    required this.initialUsername,
    required this.initialProfileImage,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isEditing = false;
  late TextEditingController usernameController;
  bool isUsernameEmpty = false;
  File? profileImage;
  bool isProfileImageChanged = false;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: widget.initialUsername);
    profileImage = widget.initialProfileImage;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage = await showModalBottomSheet<XFile>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Pilih Sumber Gambar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      final image = await picker.pickImage(source: ImageSource.camera);
                      Navigator.pop(context, image);
                    },
                    icon: const Icon(Icons.camera_alt),
                    iconSize: 50,
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                    onPressed: () async {
                      final image = await picker.pickImage(source: ImageSource.gallery);
                      Navigator.pop(context, image);
                    },
                    icon: const Icon(Icons.photo_album),
                    iconSize: 50,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    if (selectedImage != null) {
      setState(() {
        profileImage = File(selectedImage.path);
        isProfileImageChanged = true;
      });
    }
  }

  void saveChanges() {
    if (usernameController.text.trim().isEmpty) {
      setState(() {
        isUsernameEmpty = true;
      });
      return;
    }

    setState(() {
      isUsernameEmpty = false;
    });

    String updatedUsername = usernameController.text.trim();
    File? updatedProfileImage = profileImage;

    Navigator.pop(context, {
      'username': updatedUsername,
      'profileImage': updatedProfileImage,
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
              'Edit Profile',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 130),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundImage: profileImage == null
                      ? const AssetImage('image/Profile_Default.png')
                      : FileImage(profileImage!) as ImageProvider,
                ),
                IconButton(
                  onPressed: pickImage,
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
                        usernameController.text,
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
              onPressed: isEditing || isProfileImageChanged ? saveChanges : null,
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
