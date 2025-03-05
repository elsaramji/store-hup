// components/chackout/view/address_info_view.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/chackout/view/widgets/address_info_form.dart';
import 'package:store_hup/components/chackout/view/widgets/save_address.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: const SingleChildScrollView(
        child: Column(
          children: [AddressInfoForm(), SaveAddress()],
        ),
      ),
    );
  }
}
