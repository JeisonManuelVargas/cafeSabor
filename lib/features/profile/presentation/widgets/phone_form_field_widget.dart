import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';

class PhoneFromFieldWidget extends StatelessWidget {
  final PhoneController phoneController;

  const PhoneFromFieldWidget({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) => PhoneFormField(
        controller: phoneController,
        cursorColor: CafeKit.util.color.textColor,
        decoration: InputDecoration(
          label: const Text("Phone"),
          labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: CafeKit.util.color.textColor,
          ),
        ),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: CafeKit.util.color.textColor,
        ),
        selectionHeightStyle: BoxHeightStyle.includeLineSpacingBottom,
        showCursor: false,
        selectionWidthStyle: BoxWidthStyle.max,
        strutStyle: const StrutStyle(fontSize: 10),
        countrySelectorNavigator: CountrySelectorNavigator.draggableBottomSheet(
          subtitleStyle: CafeKit.util.cafeTextStyle.text,
          titleStyle: CafeKit.util.cafeTextStyle.descriptionProduct,
          searchBoxDecoration: InputDecoration(
            label: const Text("Phone"),
            labelStyle: CafeKit.util.cafeTextStyle.descriptionProduct,
          ),
        ),
        validator: PhoneValidator.compose(
          [
            PhoneValidator.required(context),
            PhoneValidator.validMobile(context),
          ],
        ),
      );
}
