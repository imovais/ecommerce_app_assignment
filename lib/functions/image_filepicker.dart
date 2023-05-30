// ignore_for_file: avoid_print

// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// void openfilepickernew(imagestore) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//       // allowMultiple: false, allowedExtensions: ['jpg', 'jpeg', 'png']
//       );

//   if (result != null) {
//     PlatformFile file = result.files.first;

//     print('Here is Your File Path: ${file.path}');

//     if (file.path != null) {
//       Reference storageReference =
//           FirebaseStorage.instance.ref().child('files/${file.name}');
//       UploadTask uploadTask = storageReference.putFile(File(file.path!));
//       TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

//       String fileUrl = await taskSnapshot.ref.getDownloadURL();
//       print('THIS IS FIRESTORE PATH: $fileUrl');

//       imagestore = fileUrl;
//       // Perform actions with the file
//       // ...
//     }
//   } else {
//     print('THERE IS AN ERROR');
//   }
// }







// OLD CODE
// Future openfilepicker() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles();

//   if (result != null) {
//     PlatformFile file = result.files.first;

//     print(file.path);

//     if (file.path != null) {
//       Reference storageReference =
//           FirebaseStorage.instance.ref().child('files/${file.name}');
//       UploadTask uploadTask = storageReference.putFile(File(file.path!));
//       TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

//       String fileUrl = await taskSnapshot.ref.getDownloadURL();
//       print('this is firestore url: $fileUrl');

//       return fileUrl;
//       // Perform actions with the file
//       // ...
//     }
//   } else {
//     // User canceled the file picking
//   }
// }
