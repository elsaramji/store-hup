// components/futures/Auth/signup/widgets/signup_addUserform.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constant/items.dart';
import '../../../../../../core/custom/widgets/custom_errors_massage.dart';
import '../../../../../../core/custom/widgets/custom_text_filed.dart';
import '../../../../../../service/state_management/sginup_cubit/sginup_cubit.dart';
import 'checkpolicies.dart';
import 'signup_Button.dart';

class AddUserForm extends StatefulWidget {
  const AddUserForm({
    super.key,
  });

  @override
  State<AddUserForm> createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  late String name, password, email;

  late bool teamPolicesAccept = false;

  late GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          CustomTextformField(
            keybordetepy: TextInputType.name,
            hinttext: "الاسم كامل",
            onsaved: (value) {
              name = value!;
            },
          ),
          const SizedBox(height: 16),
          CustomTextformField(
            keybordetepy: TextInputType.emailAddress,
            hinttext: "البريد الالكتروني",
            onsaved: (value) {
              email = value!;
            },
          ),
          const SizedBox(height: 16),
          CustomTextformField(
            onsaved: (value) {
              password = value!;
            },
            keybordetepy: TextInputType.visiblePassword,
            hinttext: "كلمة المرور",
            obscuretext: true,
            suffixicons: Items.visiibleIcons,
          ),
          const SizedBox(height: 16),
          ChackPolices(
            onChanged: (value) {
              teamPolicesAccept = value;
            },
          ),
          const SizedBox(height: 30),
          SignupButton(
            onPressed: () {
              creataAccount(context);
            },
          ),
        ],
      ),
    );
  }

  void creataAccount(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      if (teamPolicesAccept) {
        BlocProvider.of<SignupCubit>(context).signup(
          name: name,
          email: email,
          password: password,
        );
      } else {
        ErrorsMassage.errorsBar(context, "يجب الموافقة على الشروط والاحكام");
      }
    } else {
      ErrorsMassage.errorsBar(context, "يجب ملء جميع الخانات");
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
