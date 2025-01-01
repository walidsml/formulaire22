import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  _ProfileviewState createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  User? user = FirebaseAuth.instance.currentUser;
  String? profilePictureUrl;

  @override
  void initState() {
    super.initState();
    _fetchProfilePicture();
  }

  Future<void> _fetchProfilePicture() async {
    try {
      // Check if the user already has a profile picture in Firebase Storage
      final storageRef =
      FirebaseStorage.instance.ref().child('profile_pictures/${user!.uid}.jpg');
      final url = await storageRef.getDownloadURL();
      setState(() {
        profilePictureUrl = url;
      });
    } catch (e) {
      // Handle case where profile picture doesn't exist
      print("Profile picture not found: $e");
    }
  }

  Future<void> _uploadProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      try {
        // Add metadata for file type
        final metadata = SettableMetadata(contentType: 'image/jpeg');
        final storageRef =
        FirebaseStorage.instance.ref().child('profile_pictures/${user!.uid}.jpg');

        await storageRef.putFile(file, metadata);

        // Get the download URL
        final url = await storageRef.getDownloadURL();
        print("Profile picture uploaded successfully. URL: $url");

        setState(() {
          profilePictureUrl = url;
        });
      } catch (e) {
        print("Error uploading profile picture: $e");
      }
    } else {
      print("No file selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 150,
            backgroundImage: profilePictureUrl != null
                ? NetworkImage(profilePictureUrl!)
                : const AssetImage("image/Defaultpfp.jpeg") as ImageProvider,
          ),
          const SizedBox(height: 30),
          Text(
            user?.displayName ?? "No Name",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 30),
          Text(
            user?.email ?? "No Email",
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 20,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            onPressed: _uploadProfilePicture,
            child: const Text("Upload Profile Picture"),
          )
        ],
      ),
    );
  }
}
