import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'project_setup_platform_interface.dart';

/// An implementation of [ProjectSetupPlatform] that uses method channels.
class MethodChannelProjectSetup extends ProjectSetupPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('project_setup');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
