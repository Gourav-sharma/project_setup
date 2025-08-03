import '../project_setup.dart';

class PermissionHandlingService {

  Future<PermissionStatus> requestPhotosPermission() async {
    final status = await Permission.photos.request();
    return status;
  }

  Future<PermissionStatus> checkPhotosPermission() async {
    final status = await Permission.photos.status;
    return status;
  }

  Future<bool> handlePhotosPermission() async {
    final status = await Permission.photos.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      return false;
    }
    return false;
  }

  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  Future<PermissionStatus> checkCameraPermission() async {
    final status = await Permission.camera.status;
    return status;
  }

  Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  Future<PermissionStatus> checkStoragePermission() async {
    final status = await Permission.storage.status;
    return status;
  }

  Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  Future<PermissionStatus> checkLocationPermission() async {
    final status = await Permission.location.status;
    return status;
  }

  Future<bool> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    if (status.isDenied) {
      return false;
    } else if (status.isPermanentlyDenied) {
      return false;
    }
    return status.isGranted;
  }

  Future<PermissionStatus?> checkNotificationPermission() async {
    final status = await Permission.notification.status;
    switch (status) {
      case PermissionStatus.granted:
        return status;
      case PermissionStatus.denied:
        return status; // Remove the recursive call
      case PermissionStatus.permanentlyDenied:
       // openAppSettings();
        return status;
      default:
        return null;
    }
  }

}


