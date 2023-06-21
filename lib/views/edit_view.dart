import 'dart:io';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_pickers/image_pickers.dart';
import '../_importer.dart';

class EditView extends StatelessWidget {
  List<String> listImagePaths;
  Function onTapRotateImage;

  EditView(
      {required this.listImagePaths, required this.onTapRotateImage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Edit image'),
      body: listImagePaths.length == 1
          ? _buildSingleImageView()
          : _buildMultiImagesView(),
      bottomSheet: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBottomMenu(BootstrapIcons.save, 'SAVE'),
              _buildBottomMenu(BootstrapIcons.symmetry_horizontal, '↕️ FLIP'),
              _buildBottomMenu(BootstrapIcons.symmetry_vertical, '↔️ FLIP'),
              _buildBottomMenu(BootstrapIcons.share, 'SHARE'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSingleImageView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () => onTapRotateImage(),
            child: Image.file(
              File(listImagePaths.elementAt(0)),
              width: Get.width,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMultiImagesView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: listImagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () => onTapRotateImage(),
            child: Image.file(File(listImagePaths.elementAt(index))));
      },
    );
  }

  Widget _buildBottomMenu(IconData icon, String text) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: kIconBrightColor,
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: kIconBrightColor,
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              color: kTextBrightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
