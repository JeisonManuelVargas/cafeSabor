import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:image_picker_loading_jm/image_picker_loading_jm.dart';

class UserImage extends StatelessWidget {
  final bool isAsset;
  final String image;
  final Function() chooseImage;

  const UserImage({
    super.key,
    required this.image,
    required this.isAsset,
    required this.chooseImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sizeWidth(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          image.isNotEmpty && !isAsset
              ? ImagePickerLoadingJM(
                  imagePickerLoadingJModel: ImagePickerLoadingJModel(
                    image: image,
                    imageError: "assets/icons/user.png",
                    buildBody: (_, provider) => Container(
                      width: context.sizeWidth() * 0.3,
                      height: context.sizeHeight() * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: provider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: context.sizeWidth() * 0.3,
                  height: context.sizeHeight() * 0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CafeKit.util.color.green,
                  ),
                  child: Center(
                    child: image.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: FileImage(File(image)),
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : Image.asset(
                            "assets/icons/user.png",
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            height: context.sizeHeight() * 0.1,
                          ),
                  ),
                ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CafeKit.util.color.backgroundButton,
            ),
            margin: EdgeInsets.only(
              top: context.sizeHeight() * 0.1,
              left: context.sizeWidth() * 0.2,
            ),
            child: InkWell(
              onTap: chooseImage,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: CafeKit.util.color.whiteCard,
                  size: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
