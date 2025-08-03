
import '../project_setup.dart';

class ImagePickerHelper {

  static Future<String?> imagePick({
    required bool isMultiple,
  }) async {
    if(Platform.isIOS) {
      await PermissionHandlingService().handlePhotosPermission().then((
          value) async {
        if (value == true) {
          pickImage(isMultiple: isMultiple);
        } else if (value == true) {
          PermissionHandlingService().requestPhotosPermission();
          //  PermissionHandlingService().openAppSettings();
        }
      },);
    }else{
      pickImage(isMultiple: isMultiple);
    }
    return null ;
  }

  static Future<String?> pickImage({
    required bool isMultiple,
  }) async {

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile.path;
    }

    return null;
  }
}