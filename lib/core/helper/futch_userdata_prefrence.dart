import '../models/user_entity.dart';
import '../../service/database/presence.dart';

class FutchUserDataFromPreference {
  FutchUserDataFromPreference();

  static futchUserDatafromPreferenc() {
    String? user = Preferences.getStringfromShared("user");
    print("from shared preference $user");
    String format = user!.replaceAll(RegExp(r'[\{\}\[\]"]'), '');
    print("After format $format");
    Usermodel userModel = Usermodel.fromMap(format
        .split(',')
        .fold<Map<String, dynamic>>(
            {},
            (map, element) =>
                map..addAll({element.split(':')[0]: element.split(':')[1]})));
    return userModel;
  }
}
