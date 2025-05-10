import '../../../features/onboarding/core/constant/const_string_value.dart';
import '../../../features/onboarding/core/models/bord_data.dart';
import '../../../features/onboarding/widgets/titel_page_one.dart';
import '../../../features/onboarding/widgets/titel_page_tow.dart';
import '../../../core/assets/assets_image.dart';

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
