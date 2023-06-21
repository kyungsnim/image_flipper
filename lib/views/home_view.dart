import 'dart:io';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_pickers/image_pickers.dart';
import '../_importer.dart';

class HomeView extends StatelessWidget {
  List<String> listImagePaths;
  Function onTapSelectImage;

  HomeView({
    required this.listImagePaths,
    required this.onTapSelectImage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Flip image'),
      body: listImagePaths.isEmpty ? _buildNeedSelectImages()
      : _buildSelectedImages(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => onTapSelectImage(),
          label: Row(
            children: [Icon(BootstrapIcons.plus), Text('Select images')],
          )),
    );
  }

  Widget _buildNeedSelectImages() {
    return InkWell(
      onTap: () => onTapSelectImage(),
      child: Container(
        width: Get.width,
        height: Get.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              BootstrapIcons.folder_fill,
              color: kIconBrightColor,
              size: 150,
            ),
            Text(
              'Select your images',
              style: TextStyle(
                color: kTextBrightColor,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedImages() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: listImagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.file(File(listImagePaths.elementAt(index)));
      },
    );
  }
}
