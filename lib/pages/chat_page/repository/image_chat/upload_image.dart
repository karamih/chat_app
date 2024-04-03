import 'package:image_picker/image_picker.dart';

class UploadImage {
  final ImagePicker _picker = ImagePicker();

  Future<String> getImageFromGallery() async {
    XFile? pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxWidth: 720,
        maxHeight: 480);
    if (pickedImage != null) {
      return pickedImage.path;
    }
    return '';
  }
}
