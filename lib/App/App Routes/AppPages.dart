import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:monimo/App/Middleware/AuthMiddleware.dart';
import 'package:monimo/App/modules/AllProperty/AllPropertyBinding.dart';
import 'package:monimo/App/modules/AnlageSingleProperty/AnlageSinglePropertyBinding.dart';
import 'package:monimo/App/modules/CostCalculateQuestion/CostCalculateQuestionBinding.dart';
import 'package:monimo/App/modules/DepreciationQuestion/DepreciationQuestionBinding.dart';
import 'package:monimo/App/modules/DesignSetting/DesignSettingBinding.dart';
import 'package:monimo/App/modules/EignennutzungInsurance/EignennutzungInsuranceBinding.dart';
import 'package:monimo/App/modules/ExtraCostQuestion/ExtraCostQuestionBinding.dart';
import 'package:monimo/App/modules/FinancingQuestion/FinancingQuestionBinding.dart';
import 'package:monimo/App/modules/InfoPage/InfoPageBinding.dart';
import 'package:monimo/App/modules/Insurance/InsuranceBinding.dart';
import 'package:monimo/App/modules/IntroQuestion/IntroQuestionBinding.dart';
import 'package:monimo/App/modules/IntroScreen/IntroScreen.dart';
import 'package:monimo/App/modules/IntroScreen/IntroScreenBinding.dart';
import 'package:monimo/App/modules/MaintenanceQuestion/MaintenanceQuestionBinding.dart';
import 'package:monimo/App/modules/Profile/ProfileBinding.dart';
import 'package:monimo/App/modules/RootScreen/RootScreenBinding.dart';
import 'package:monimo/App/modules/SignupScreen/SignupBinding.dart';
import 'package:monimo/App/modules/SmokeDetector/SmokeDetectorBinding.dart';
import 'package:monimo/App/modules/SplashScreen/SplashScreenBinding.dart';
import 'package:monimo/App/modules/TerminationQuestion/TerminationQuestionBinding.dart';
import 'package:monimo/App/modules/UserfulLifeQuestion/UserfulLifeQuestionBinding.dart';
import '../modules/AllProperty/AllProperty.dart';
import '../modules/AnlageSingleProperty/AnlageSingleProperty.dart';
import '../modules/CostCalculateQuestion/CostCalculateQuestion.dart';
import '../modules/DepreciationQuestion/DepreciationQuestion.dart';
import '../modules/DesignSetting/DesignSetting.dart';
import '../modules/EignennutzungInsurance/EignennutzungInsurance.dart';
import '../modules/ExtraCostQuestion/ExtraCostQuestion.dart';
import '../modules/FinancingQuestion/FinancingQuestion.dart';
import '../modules/IndividualSingleProperty/SinglePropertyBinding.dart';
import '../modules/InfoPage/InfoPage.dart';
import '../modules/Insurance/Insurance.dart';
import '../modules/IntroQuestion/IntroQuestion.dart';
import '../modules/LeaseholdQuestion/Leasehold.dart';
import '../modules/LeaseholdQuestion/LeaseholdBinding.dart';
import '../modules/MaintenanceQuestion/MaintenanceQuestion.dart';
import '../modules/Profile/Profile.dart';
import '../modules/RootScreen/RootScreen.dart';
import '../modules/SignupScreen/Signup.dart';
import '../modules/IndividualSingleProperty/SingleProperty.dart';
import '../modules/SmokeDetector/SmokeDetector.dart';
import '../modules/SplashScreen/SplashScreen.dart';
import '../modules/TerminationQuestion/TerminationQuestion.dart';
import '../modules/UserfulLifeQuestion/UserfulLifeQuestion.dart';
import 'Routes.dart';

class AppPages{
  static final routes = [
    GetPage(
      name: Routes.SplashScreen,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.IntroScreen,
      page: () => IntroScreen(),
      binding: IntroScreenBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.Signup,
      page: () => Signup(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.RootScreen,
      page: () => RootScreen(),
      binding: RootScreenBinding(),
    ),
    GetPage(
      name: Routes.IntroQuestion,
      page: () => IntroQuestion(),
      binding: IntroQuestionBinding(),
    ),
    GetPage(
      name: Routes.AllProperty,
      page: () => AllProperty(),
      binding: AllPropertyBinding(),
    ),
    GetPage(
      name: Routes.SingleProperty,
      page: () => SingleProperty(),
      binding: SinglePropertyBinding(),
    ),
    GetPage(
      name: Routes.SmokeDetector,
      page: () => SmokeDetector(),
      binding: SmokeDetectorBinding(),
    ),
    GetPage(
      name: Routes.DesignSetting,
      page: () => DesignSetting(),
      binding: DesignSettingBinding(),
    ),
    GetPage(
      name: Routes.Profile,
      page: () => Profile(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.Insurance,
      page: () => Insurance(),
      binding: InsuranceBinding(),
    ),
    GetPage(
      name: Routes.AnlageSingleProperty,
      page: () => AnlageSingleProperty(),
      binding: AnlageSinglePropertyBinding(),
    ),
    GetPage(
      name: Routes.TerminationQuestion,
      page: () => TerminationQuestion(),
      binding: TerminationQuestionBinding(),
    ),
    GetPage(
      name: Routes.Leasehold,
      page: () => Leasehold(),
      binding: LeaseholdBinding(),
    ),
    GetPage(
      name: Routes.DepreciationQuestion,
      page: () => DepreciationQuestion(),
      binding: DepreciationQuestionBinding(),
    ),
    GetPage(
      name: Routes.MaintenanceQuestion,
      page: () => MaintenanceQuestion(),
      binding: MaintenanceQuestionBinding(),
    ),
    GetPage(
      name: Routes.FinancingQuestion,
      page: () => FinancingQuestion(),
      binding: FinancingQuestionBinding(),
    ),
    GetPage(
      name: Routes.UsefulLifeQuestion,
      page: () => UsefulLifeQuestion(),
      binding: UserfulLifeQuestionBinding(),
    ),
    GetPage(
      name: Routes.ExtraCostQuestion,
      page: () => ExtraCostQuestion(),
      binding: ExtraCostQuestionBinding(),
    ),
    GetPage(
      name: Routes.CostCalculateQuestion,
      page: () => CostCalculateQuestion(),
      binding: CostCalculateQuestionBinding(),
    ),
    GetPage(
      name: Routes.EignennutzungInsurance,
      page: () => EignennutzungInsurance(),
      binding: EignennutzungInsuranceBinding(),
    ),
    GetPage(
      name: Routes.InfoPage,
      page: () => InfoPage(),
      binding: InfoPageBinding(),
    ),
  ];
}