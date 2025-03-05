// components/chackout/view/widgets/address_info_form.dart
import 'package:flutter/material.dart';
import 'package:store_hup/core/custom/widgets/custom_text_filed.dart';

class AddressInfoForm extends StatelessWidget {
  const AddressInfoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        CustomTextformField(
            keybordetepy: TextInputType.name, hinttext: "الاسم كامل"),
        const SizedBox(height: 16),
        CustomTextformField(
            keybordetepy: TextInputType.emailAddress,
            hinttext: "البريد الالكتروني"),
        const SizedBox(height: 16),
        CustomTextformField(
            keybordetepy: TextInputType.phone, hinttext: "رقم الهاتف"),
        const SizedBox(height: 16),
        CustomTextformField(
            keybordetepy: TextInputType.streetAddress, hinttext: "العنوان"),
        const SizedBox(height: 16),
        CustomTextformField(
            keybordetepy: TextInputType.streetAddress,
            hinttext: "الطابق , الشقه .."),
        const SizedBox(height: 16),
        
      ],
    );
  }
}
