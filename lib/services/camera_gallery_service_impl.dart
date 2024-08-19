import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:notification/services/camera_gallery_service.dart';

class CameraGalleryServiceImpl implements CameraGalleryService {
  final ImagePickerPlatform imagePickerImplementation =
      ImagePickerPlatform.instance;
  final ImagePicker _picker = ImagePicker();

  @override
  Future<String?> selectPhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo == null) return null;
    return photo.path;
  }

  @override
  Future<String?> takePhoto() async {
    final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    if (photo == null) return null;
    return photo.path;
  }
}
