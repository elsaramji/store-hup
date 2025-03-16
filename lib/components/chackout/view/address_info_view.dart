// components/chackout/view/address_info_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_hup/components/chackout/view/widgets/address_info_form.dart';
import 'package:store_hup/components/chackout/view/widgets/save_address.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AddressInfoForm(
              addressModel: context.read<AddressModel>(),
            ),
            const SaveAddress()
          ],
        ),
      ),
    );
  }
}

class AddressModel {
  String? name;
  String? address;
  String? phone;
  String? email;
  String? floor;
}
