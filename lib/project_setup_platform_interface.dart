import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'project_setup_method_channel.dart';

abstract class ProjectSetupPlatform extends PlatformInterface {
  /// Constructs a ProjectSetupPlatform.
  ProjectSetupPlatform() : super(token: _token);

  static final Object _token = Object();

  static ProjectSetupPlatform _instance = MethodChannelProjectSetup();

  /// The default instance of [ProjectSetupPlatform] to use.
  ///
  /// Defaults to [MethodChannelProjectSetup].
  static ProjectSetupPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ProjectSetupPlatform] when
  /// they register themselves.
  static set instance(ProjectSetupPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
