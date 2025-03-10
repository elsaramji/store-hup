// components/chackout/view/widgets/address_info_form.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/chackout/view/address_info_view.dart';
import 'package:store_hup/core/custom/widgets/custom_text_filed.dart';

// ignore: must_be_immutable
class AddressInfoForm extends StatelessWidget {
  static GlobalKey<FormState> formkey = GlobalKey();
  AddressInfoForm({
    super.key,
    required this.addressModel,
  });

  AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomTextformField(
              onChanged: (value) {
                addressModel.name = value!;
              },
              keybordetepy: TextInputType.name,
              hinttext: "الاسم كامل"),
          const SizedBox(height: 16),
          CustomTextformField(
              onChanged: (value) {
                addressModel.email = value!;
              },
              keybordetepy: TextInputType.emailAddress,
              hinttext: "البريد الالكتروني"),
          const SizedBox(height: 16),
          CustomTextformField(
              onChanged: (value) {
                addressModel.phone = value!;
              },
              keybordetepy: TextInputType.phone,
              hinttext: "رقم الهاتف"),
          const SizedBox(height: 16),
          CustomTextformField(
              onChanged: (value) {
                addressModel.address = value!;
              },
              keybordetepy: TextInputType.streetAddress,
              hinttext: "العنوان"),
          const SizedBox(height: 16),
          CustomTextformField(
              onChanged: (value) {
                addressModel.floor = value!;
              },
              keybordetepy: TextInputType.streetAddress,
              hinttext: "الطابق , الشقه .."),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
