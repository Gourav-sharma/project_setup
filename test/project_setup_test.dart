import 'package:flutter_test/flutter_test.dart';
import 'package:project_setup/project_setup.dart';
import 'package:project_setup/project_setup_platform_interface.dart';
import 'package:project_setup/project_setup_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockProjectSetupPlatform
    with MockPlatformInterfaceMixin
    implements ProjectSetupPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ProjectSetupPlatform initialPlatform = ProjectSetupPlatform.instance;

  test('$MethodChannelProjectSetup is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelProjectSetup>());
  });

  test('getPlatformVersion', () async {
    ProjectSetup projectSetupPlugin = ProjectSetup();
    MockProjectSetupPlatform fakePlatform = MockProjectSetupPlatform();
    ProjectSetupPlatform.instance = fakePlatform;

    expect(await projectSetupPlugin.getPlatformVersion(), '42');
  });
}
