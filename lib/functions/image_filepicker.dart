import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future openFilePicker(String imagestore) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    PlatformFile file = result.files.first;




    // if (file.path != null) {
    //   Reference storageReference =
    //       FirebaseStorage.instance.ref().child('files/${file.name}');
    //   UploadTask uploadTask = storageReference.putFile(File(file.path!));
    //   TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    //   String fileUrl = await taskSnapshot.ref.getDownloadURL();

    //   // Save the file URL to Firestore
    //   await FirebaseFirestore.instance.collection('allproducts').add({
    //     imagestore: fileUrl,
    //   });

    // Perform actions with the file
    // ...
    //}
  } else {
    // User canceled the file picking
  }
}
