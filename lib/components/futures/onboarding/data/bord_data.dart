import 'package:store_hup/components/futures/onboarding/core/constant/const_string_value.dart';
import 'package:store_hup/components/futures/onboarding/core/models/bord_data.dart';
import 'package:store_hup/components/futures/onboarding/widgets/titel_page_one.dart';
import 'package:store_hup/components/futures/onboarding/widgets/titel_page_tow.dart';
import 'package:store_hup/core/assets/assets_image.dart';

class BordData {
  static List<BordModel> pagesdata = [
    BordModel(
      description: ConstStringValue.descriptionone,
      image: Assets.assetsImagesFruitsonbording,
      title: const TitelPageOne(),
    ),
    BordModel(
      description: ConstStringValue.descriptiontow,
      image: Assets.assetsImagesPineappleonbording,
      title: const TitelPageTow(),
    ),
  ];
}
