import 'package:veloura/core/constants/app_aseets_strings.dart';
import 'package:veloura/core/constants/app_strings.dart';
import 'package:veloura/features/onboarding/domain/models/onboarding_page_model.dart';

 const List<OnboardingPageModel> pages = [
  OnboardingPageModel(
    imageUrl: AppAssetsStrings.onboardingShoesImage,
    title: AppStrings.firstOnboardeingScreenTitle,
    subtitle: AppStrings.firstOnboardingScreenSubtitle,
  ),
  OnboardingPageModel(
    imageUrl: AppAssetsStrings.onboardingSuitImage,
    title: AppStrings.secondOnboardingScreenTitle,
    subtitle: AppStrings.secondOnboardingScreenSubtitle,
  ),
  OnboardingPageModel(
    imageUrl: AppAssetsStrings.onboardingBagImage,
    title: AppStrings.thirdOnboardingScreenTitle,
    subtitle: AppStrings.thirdOnboardingScreenSubtitle,
  ),
];
