// components/profile/user_profile.dart
// components/profile/user_profile.dar

import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/userProfile';
  static const index = 3;
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Container(
        child: const Center(
          child: Text("UserProfile"),
        ),
      
    );
  }
}
