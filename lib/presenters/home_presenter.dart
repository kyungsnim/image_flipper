import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_pickers/image_pickers.dart';
import '../_importer.dart';

class HomePresenter extends StatefulWidget {
  const HomePresenter({Key? key}) : super(key: key);

  @override
  State<HomePresenter> createState() => _HomePresenterState();
}

class _HomePresenterState extends State<HomePresenter> {
  List<String> _listImagePaths = [];

  @override
  Widget build(BuildContext context) {
    return HomeView(
      listImagePaths: _listImagePaths,
      onTapSelectImage: () => _onTapSelectImage(),
    );
  }

  void _onTapSelectImage() async {
    await ImagePickers.pickerPaths(
        galleryMode: GalleryMode.image,
        selectCount: 20,
        showGif: false,
        showCamera: true,
        compressSize: 500,
        uiConfig: UIConfig(
          uiThemeColor: kBackgroundColor,
        ),
        cropConfig: CropConfig(enableCrop: false, width: 2, height: 1)).then((medias) {
      for(int i = 0; i < medias.length; i++) {
        _listImagePaths.add(medias.elementAt(i).path!);
      }
    });

    _listImagePaths.isNotEmpty ? Get.to(() => EditPresenter(
      listImagePaths: _listImagePaths,
    )) : BootstrapAlert(text: 'Please select images');
  }
}
