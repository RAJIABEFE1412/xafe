import 'dart:developer';

import 'package:flutter/material.dart'
    show BuildContext, Widget, MaterialPageRoute, Route, RouteSettings;
import 'package:xafe/presentation/screens/auth/sign_up.dart';
import 'package:xafe/presentation/screens/auth/login.dart';
import 'package:xafe/presentation/screens/dashboard/home.dart';
import 'package:xafe/presentation/screens/launch_screen.dart';

class XafeRoutes {
  static Widget home = LaunchScreen();

  /// Splash Routes
  static const welcome = "/launch";

  /// password Routes
  static const password = "/password";

  /// email
  static const email = "/email";

  /// Auth
  static const login = "/login";
  static const otpVerify = "/signup/otp";
  static const dashboard = "/home/dashboard";
  static const signupProfileSetup = "/signup/profile";
  static const signupComplete = "/signup/complete";

  /// Password Recovery
  static const passwordRecovery = "/password/recovery";
  static const passwordRecoveryOtp = "/password/recovery/otp";
  static const passwordRecoverySuccess = "/password/recovery/success";
  static const passwordRecoveryReset = "/password/recovery/reset";

  /// Profile Information
  // static const profileBvn = "/profile/bvn";
  static const profileInfo = "/profile/info";
  static const profileContact = "/profile/contact";
  static const profileNextOfKin = "/profile/nok";
  static const profileBank = "/profile/bank";
  static const profileVerificationOptions = "/profile/verification/options";
  static const profileVerification = "/profile/verification/";
  static const profileWorkStatus = "/profile/work/status";
  static const profileWorkStatusForm = "/profile/work/form";
  static const profileSetupSuccess = "/profile/success";

  /// Profile Information
  static const loanAmount = "/loan/amount";
  static const loanCardSelect = "/loan/cards";
  static const loanCardCreate = "/loan/cards/create";
  static const loanOtp = "/loan/otp";
  static const loanSuccess = "/loan/success";
  static const loanReview = "/loan/review";

  static Map<String, Widget Function(BuildContext)> staticRoutes = {
    welcome: (BuildContext context) => LaunchScreen(),
    login: (BuildContext context) => LoginPage(),
    email: (BuildContext context) => EmailPage(),
    dashboard: (BuildContext context) => Home(),
    // signupComplete: (BuildContext context) => const SignupCompletePage(),
    // passwordRecovery: (BuildContext context) => const PasswordRecoveryPage(),
    // loanSuccess: (BuildContext context) => const LoanSuccessPage(),
    // loanOtp: (BuildContext context) => const LoanOtpPage(),
    // loanCardSelect: (BuildContext context) => const LoanCardSelectionPage(),
    // loanCardCreate: (BuildContext context) => const LoanCardCreatePage(),
    // loanReview: (BuildContext context) => const LoanReviewPage(),
  };

  static Route<dynamic> dynamicRoutes(RouteSettings settings) {
    switch (settings.name) {
      // case profileBvn:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProfileBvnEntryPage(settings.arguments);
      //     },
      //   );
      // case profileInfo:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProfileInfoEntryPage(settings.arguments);
      //     },
      //   );
      // case profileContact:
      //   // log("ohk -- ${settings.arguments}");
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProfileContactEntryPage(settings.arguments);
      //     },
      //   );
      // case profileNextOfKin:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProfileNokEntryPage(settings.arguments);
      //     },
      //   );
      // case profileSetupSuccess:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProfileSetupSuccessPage(arguments: settings.arguments);
      //     },
      //   );
      // case profileBank:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProfileBankEntryPage();
      //     },
      //   );
      // case profileVerificationOptions:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProfileVerificationOptionsPage(settings.arguments);
      //     },
      //   );
      // case profileWorkStatus:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProfileWorkStatusPage(settings.arguments);
      //     },
      //   );
      // case otpVerify:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return SignupOtpPage(settings.arguments);
      //     },
      //   );
      // case signupPassword:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return SignupPasswordSetupPage(settings.arguments);
      //     },
      //   );
      // case signupProfileSetup:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return SignupProfilePage(settings.arguments);
      //     },
      //   );
      // case passwordRecoverySuccess:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return PasswordRecoverySuccessPage(settings.arguments);
      //     },
      //   );
      // case passwordRecoveryReset:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return PasswordRecoveryResetPage(settings.arguments);
      //     },
      //   );
      // case passwordRecoveryOtp:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return PasswordRecoveryOtpPage(settings.arguments);
      //     },
      //   );
      // case profileWorkStatusForm:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProfileWorkStatusEntryPage(settings.arguments);
      //     },
      //   );
      // case profileVerification:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ProfileVerificationPage(settings.arguments);
      //     },
      //   );
      // case loanAmount:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return LoanAmountEntryPage(settings.arguments);
      //     },
      //   );
      // default:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return SplashPage();
      //     },
      //   );
    }
  }
}
