// components/chackout/view/address_info_view.dart
import 'package:flutter/cupertino.dart';
import 'package:store_hup/core/custom/widgets/custom_text_filed.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
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
            Row(
              children: [
                CupertinoSwitch(
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                ),
                Text(
                  "حفظ العنوان",
                  style: TextsStyle.semibold13
                      .copyWith(color: AppColors.grayscale400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
