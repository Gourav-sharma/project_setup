import 'project_setup_platform_interface.dart';


export 'dart:convert';
export 'dart:io';
export 'package:flutter/material.dart';
export 'package:http_parser/http_parser.dart';
export 'package:flutter/gestures.dart';
export 'dart:async';
export 'package:flutter/services.dart';
export 'package:flutter_svg/svg.dart';
export 'package:flutter/foundation.dart';


//network
export 'package:dio/dio.dart';
export 'networks/api_client.dart';
export 'networks/custom_interceptors.dart';
export 'networks/api_repo.dart';
export 'networks/response_model.dart';

//responsive
export 'package:flutter_screenutil/flutter_screenutil.dart';

//storage
export 'keys/storage_keys.dart';
export 'package:get_storage/get_storage.dart';

//feature
export 'core/asset_widget.dart';
export 'core/body_widget.dart';
export 'core/button_widget.dart';
export 'core/text_widget.dart';
export 'core/text_input_widget.dart';
export 'core/alert_dialog.dart';
export 'core/logout_dialog.dart';
export 'core/custom_svg_widget.dart';
export 'core/custom_file_widget.dart';
export 'core/custom_container.dart';
export 'core/custom_list_widget.dart';
export 'app_utils/common_util_methods.dart';
export 'app_utils/print_logs.dart';
export 'app_utils/multipart_request.dart';
export 'core/custom_swicth_button.dart';

//style
export 'style_theme/app_dimension.dart';
export 'package:cached_network_image/cached_network_image.dart';



class ProjectSetup {
  Future<String?> getPlatformVersion() {
    return ProjectSetupPlatform.instance.getPlatformVersion();
  }
}
