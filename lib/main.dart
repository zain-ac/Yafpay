import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_id/smile_id.dart';
import 'package:sample/utils/app_colors.dart';
import 'package:sample/view%20model/auth_view_model.dart';
import 'package:sample/view%20model/onBoarding_view_Model.dart';

import 'package:sample/views/auth/signup/stepper/controller/stepper_controller.dart';
import 'package:sample/views/bottomnav/benefits/components/add_benifiery.dart';

import 'package:sample/views/bottomnav/benefits/controller/benefits_controller.dart';
import 'package:sample/views/bottomnav/bottom_nav.dart';
import 'package:sample/views/bottomnav/home/components/balances.dart';
import 'package:sample/views/bottomnav/home/components/cardview/mycards.dart';
import 'package:sample/views/bottomnav/home/components/cardview/topup.dart';
import 'package:sample/views/bottomnav/home/components/my_payee/send_to_new_recipient.dart';

import 'package:sample/views/bottomnav/home/home_page.dart';
import 'package:sample/views/bottomnav/invoice/controller/invoice_controller.dart';
import 'package:sample/views/bottomnav/invoice/invoice_details.dart';
import 'package:sample/views/bottomnav/new_nav.dart';

import 'package:sample/views/bottomnav/transactions/controller/transactionController.dart';
import 'package:sample/views/card_setting.dart';
import 'package:sample/views/new%20views/cnic_scanner_page.dart';
import 'package:sample/views/new_updated_views/add_customer.dart';
import 'package:sample/views/new_updated_views/add_invoice_view.dart';
import 'package:sample/views/new_updated_views/enable_security_app.dart';
import 'package:sample/views/new_updated_views/enable_text_message.dart';
import 'package:sample/views/new_updated_views/review_transaction.dart';
import 'package:sample/views/new_updated_views/swap_funds.dart';
import 'package:sample/views/new_updated_views/twofactorscreen.dart';
import 'package:sample/views/notification/notification_screen.dart';
import 'package:sample/views/payment_information.dart';

import 'package:sample/views/profile/controller/profile_view_controller.dart';
import 'package:sample/views/splash/splash_screen.dart';

import 'views/bottomnav/home/components/foriegn_transfer/controller/account_report_controller.dart';
import 'views/bottomnav/home/components/paymeny_links/payment_link_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SmileID.initialize();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StepperController()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => InvoiceController()),
        ChangeNotifierProvider(create: (_) => BenefitsController()),
        ChangeNotifierProvider(create: (_) => TransactionController()),
        ChangeNotifierProvider(create: (_) => ProfileViewController()),
        ChangeNotifierProvider(create: (_) => AccountReportController()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            builder: OneContext().builder,
            navigatorKey: OneContext().navigator.key,
            debugShowCheckedModeBanner: false,
            title: 'Yafpay',
            theme: ThemeData(
              colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              useMaterial3: false,
            ),
            // home: PaymentInformationScreen(),
            // home: ReviewTransaction(),
            home: SplashScreen(),
            // home: MainContent(),
            // home: AddInvoiceView(),
          );
        },
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:smile_id/messages.g.dart';
// import 'package:smile_id/smile_id.dart';
// import 'package:smile_id/smile_id_document_verification.dart';
// import 'package:smile_id/smile_id_smart_selfie_enrollment.dart';
// import 'package:smile_id/smile_id_smart_selfie_authentication.dart';
//
// // ignore_for_file: avoid_print
//
// void main() {
//   SmileID.initialize();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//     SmileID.initialize();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "Smile ID",
//       // MainContent requires its own BuildContext for Navigator to work, hence it is defined as its
//       // own widget
//       home: MainContent(),
//     );
//   }
// }
//
// class MyScaffold extends StatelessWidget {
//   final Widget body;
//   const MyScaffold({super.key, required this.body});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(),
//         title: const Text("Smile ID"),
//       ),
//       body: body,
//     );
//   }
// }
//
// class MainContent extends StatelessWidget {
//   const MainContent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MyScaffold(
//         body: Center(
//             child: Column(
//       children: [
//         enhancedKycAsyncButton(),
//         documentVerificationButton(context),
//         smartSelfieEnrollmentButton(context),
//         smartSelfieAuthenticationButton(context)
//       ],
//     )));
//   }
//
//   Widget enhancedKycAsyncButton(){
//     return ElevatedButton(
//         child: const Text("Enhanced KYC (Async)"),
//         onPressed: () {
//           SmileID.initialize();
//           var userId = "<your user's user ID>";
//           SmileID.api.authenticate(FlutterAuthenticationRequest(
//             jobType: FlutterJobType.enhancedKyc,
//             userId: userId,
//           )).then((authResponse) => {
//             SmileID.api.doEnhancedKycAsync(FlutterEnhancedKycRequest(
//                 country: "GH",
//                 idType: "DRIVERS_LICENSE",
//                 idNumber: "B0000000",
//                 callbackUrl: "https://webhook.site/a3d19f24-769a-46f2-997c-d186c3ae70ea",
//                 partnerParams: FlutterPartnerParams(
//                   jobType: FlutterJobType.enhancedKyc,
//                   jobId: userId,
//                   userId: userId,
//                 ),
//                 timestamp: authResponse!.timestamp,
//                 signature: authResponse.signature
//             ))
//           }, onError: (error) => {print("error: $error")});
//         }
//     );
//   }
//
//   Widget documentVerificationButton(BuildContext context) {
//     return ElevatedButton(
//       child: const Text("Document Verification"),
//       onPressed: () {
//         Navigator.of(context).push(
//           MaterialPageRoute<void>(
//             builder: (BuildContext context) => MyScaffold(
//                 body: SmileIDDocumentVerification(
//                   countryCode: "GH",
//                   documentType: "DRIVERS_LICENSE",
//                   onSuccess: (String? result) {
//                     // Your success handling logic
//                     final snackBar = SnackBar(content: Text("Success: $result"));
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                     // Navigator.of(context).pop();
//                   },
//                   onError: (String errorMessage) {
//                     // Your error handling logic
//                     final snackBar = SnackBar(content: Text("Error: $errorMessage"));
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                     // Navigator.of(context).pop();
//                   },
//             )),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget smartSelfieEnrollmentButton(BuildContext context) {
//     return ElevatedButton(
//       child: const Text("SmartSelfie Enrollment"),
//       onPressed: () {
//         Navigator.of(context).push(
//           MaterialPageRoute<void>(
//             builder: (BuildContext context) => MyScaffold(
//                 body: SmileIDSmartSelfieEnrollment(
//                   onSuccess: (String? result) {
//                     // Your success handling logic
//                     final snackBar = SnackBar(content: Text("Success: $result"));
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                     // Navigator.of(context).pop();
//                   },
//                   onError: (String errorMessage) {
//                     // Your error handling logic
//                     final snackBar = SnackBar(content: Text("Error: $errorMessage"));
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                     // Navigator.of(context).pop();
//                   },
//                 )),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget smartSelfieAuthenticationButton(BuildContext context) {
//     return ElevatedButton(
//       child: const Text("SmartSelfie Authentication"),
//       onPressed: () {
//         Navigator.of(context).push(
//           MaterialPageRoute<void>(
//             builder: (BuildContext context) => MyScaffold(
//                 body: SmileIDSmartSelfieAuthentication(
//                   onSuccess: (String? result) {
//                     // Your success handling logic
//                     final snackBar = SnackBar(content: Text("Success: $result"));
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                     // Navigator.of(context).pop();
//                   },
//                   onError: (String errorMessage) {
//                     // Your error handling logic
//                     final snackBar = SnackBar(content: Text("Error: $errorMessage"));
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                     // Navigator.of(context).pop();
//                   },
//                 )),
//           ),
//         );
//       },
//     );
//   }
// }
