import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 400,
              width: 300,
              child: _image == null ? const Text('No image selected') : Image.file(File(_image!.path)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Book name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  )
                ),
              ),
            ),
            TextButton(
              onPressed: uploadData,
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.deepPurple)
              ),
              child: const Text('Upload'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void uploadData() async {
    var imageName = DateTime.now().millisecondsSinceEpoch.toString();
    var storageRef = FirebaseStorage.instance.ref().child('driver_images/$imageName.jpg');
    File? file = File(_image!.path);
    var uploadTask = storageRef.putFile(file);
    var downloadUrl = await (await uploadTask).ref.getDownloadURL();
    var db = FirebaseFirestore.instance;
    db.collection('books').add({
      'Name' : nameController.text,
      'URL' : downloadUrl,
    });
    Navigator.pushNamed(context, '/dashboard');
  }
}
