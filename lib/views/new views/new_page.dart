import 'package:flutter/material.dart';
import 'package:smile_id/smile_id_document_verification.dart';
class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return  SmileIDDocumentVerification(countryCode: "GH", onSuccess:
        (resultJson) {

        }, onError: (errorMessage) {
      print('asasasa$errorMessage');
    },);
  }
}
