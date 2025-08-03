import 'project_setup_platform_interface.dart';


export 'package:flutter_bloc/flutter_bloc.dart';
export 'dart:convert';
export 'dart:io';
export 'package:flutter/material.dart';
export 'package:http_parser/http_parser.dart';
export 'package:flutter/gestures.dart';
export 'dart:async';
export 'package:flutter/services.dart';
export 'package:flutter_svg/svg.dart';
export 'package:flutter/foundation.dart';
export 'package:permission_handler/permission_handler.dart';


//network
export 'package:dio/dio.dart';
export 'api_calling/api_client.dart';
export 'api_calling/api_repo.dart';
export 'api_calling/response_model.dart';

//storage
export 'api_calling/storage_keys.dart';

//feature
export 'common_widget/asset_widget.dart';
export 'common_widget/body_widget.dart';
export 'common_widget/button_widget.dart';
export 'common_widget/text_widget.dart';
export 'common_widget/text_input_widget.dart';
export 'common_widget/alert_dialog.dart';
export 'common_widget/logout_dialog.dart';
export 'common_widget/permission_dialog.dart';
export 'common_widget/custom_svg_widget.dart';
export 'common_widget/custom_file_widget.dart';
export 'common_widget/custom_container.dart';
export 'common_widget/custom_list_widget.dart';
export 'app_utils/common_util_methods.dart';
export 'app_utils/app_logs.dart';
export 'app_utils/image_pick.dart';
export 'app_utils/multipart_request.dart';
export 'app_utils/permission_handling_service.dart';

//style
export 'style_theme/app_dimension.dart';
export 'style_theme/color_resource.dart';
export 'style_theme/image_resource.dart';
export 'style_theme/string_resource.dart';
export 'style_theme/light_theme.dart';
export 'style_theme/dark_theme.dart';
export 'package:loading_overlay_pro/loading_overlay_pro.dart';
export 'package:image_picker/image_picker.dart';
export 'package:cached_network_image/cached_network_image.dart';

//bloc
export 'app_bloc/app_bloc.dart';
export 'form_bloc/form_bloc.dart';

//event
export 'app_bloc/app_bloc_event.dart';
export 'form_bloc/form_event.dart';

//state
export 'app_bloc/app_bloc_state.dart';
export 'form_bloc/form_page_state.dart';


//view
export 'form_bloc/form_page.dart';



class ProjectSetup {
  Future<String?> getPlatformVersion() {
    return ProjectSetupPlatform.instance.getPlatformVersion();
  }
}
