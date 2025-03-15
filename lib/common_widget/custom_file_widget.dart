import 'dart:io';
import '../project_setup.dart';
import 'package:flutter/material.dart';

class CustomFileWidget extends StatelessWidget {
  final String? filePath;
  final BoxFit? boxfit;
  final double? height;
  final double? width;

  const CustomFileWidget({
    super.key,
    this.filePath,
    this.boxfit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return filePath != null
        ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
              border: Border.all(color: ColorResource.appThemeColor),
            ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image.file(
                File(filePath!),
                height: height,
                width: width,
                fit: boxfit ?? BoxFit.cover,
              ),
          ),
        )
        : Container();
  }
}