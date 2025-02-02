// components/profile/user_profile.dart
// components/profile/user_profile.dar

import 'package:flutter/material.dart';
import 'package:store_hup/components/navigation/view/bottom_navigation_bar.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/userProfile';
  static const index = 3;
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: index,),
      body: Container(
        child: Center(
          child: Text("UserProfile"),
        ),
      ),
    );
  }
}
