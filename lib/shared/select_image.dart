import 'package:image_picker/image_picker.dart';

Future<String?> selectImageFromGallery() async {
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 10);
  return file?.path;
}

Future<String?> selectImageFromCamera() async {
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 10);
  return file?.path;
}
