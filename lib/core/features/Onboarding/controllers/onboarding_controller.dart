import 'package:get/get.dart';

import '../../../Utils/text_strings.dart';
import '../views/widgets/onboarding_tile.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';

class DataConstants {
  static final pages = [
      OnboardingTileWidget(
        image: tOnboardingImage1,
        title: LocalKeys.tOnboardingTitle1.tr,
        subTitle: LocalKeys.tOnboardingSubTitle1.tr,
      ),

      OnboardingTileWidget(
        image: tOnboardingImage2,
        title: LocalKeys.tOnboardingTitle2.tr,
        subTitle: LocalKeys.tOnboardingSubTitle2.tr,
      ),

      OnboardingTileWidget(
        image: tOnboardingImage3,
        title: LocalKeys.tOnboardingTitle3.tr,
        subTitle: LocalKeys.tOnboardingSubTitle3.tr,
      ),
  ];
}