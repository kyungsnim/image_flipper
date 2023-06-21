import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_pickers/image_pickers.dart';
import '../_importer.dart';

class EditPresenter extends StatefulWidget {
  List<String> listImagePaths;

  EditPresenter({required this.listImagePaths, Key? key}) : super(key: key);

  @override
  State<EditPresenter> createState() => _EditPresenterState();
}

class _EditPresenterState extends State<EditPresenter> {
  @override
  Widget build(BuildContext context) {
    return EditView(
      listImagePaths: widget.listImagePaths,
      onTapRotateImage: () => _onTapRotateImage(),
    );
  }

  void _onTapRotateImage() async {
    File fixedFile = await rotateImage(widget.listImagePaths.elementAt(0));
    setState(() {
      print(widget.listImagePaths);
      widget.listImagePaths.removeAt(0);
      print(widget.listImagePaths);
      widget.listImagePaths.add(fixedFile.path);
      print(widget.listImagePaths);
    });
  }

  // 함수 정의
  Future<File> rotateImage(String path) async {
    final originalFile = File(path);
    Uint8List imageBytes = await originalFile.readAsBytes();
    final originalImage = img.decodeImage(imageBytes);

    img.Image fixedImage;
    fixedImage = img.copyRotate(originalImage!, angle: 90); // 90도 회전
    fixedImage = img.flipHorizontal(fixedImage); // 좌우 반전

    final fixedFile = await originalFile.writeAsBytes(img.encodeJpg(fixedImage)); // JPG 형태로 File 저장
    return fixedFile;
  }
}
