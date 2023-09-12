import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// {@template captcha_body}
/// Body of the CaptchaPage.
///
/// Add what it does
/// {@endtemplate}
class CaptchaBody extends StatefulWidget {
  /// {@macro captcha_body}
  const CaptchaBody({super.key});

  @override
  State<CaptchaBody> createState() => _CaptchaBodyState();
}

class _CaptchaBodyState extends State<CaptchaBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context)
            .size
            .height, //90 for smaller notice, 500 for bigger one
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: InAppWebView(
          // initialFile: 'assets/index.html',
          // initialUrlRequest:
          //     URLRequest(url: Uri.parse('https://flutter-ecom-776db.web.app/')),
          onWebViewCreated: (controller) {
            controller.loadUrl(
                urlRequest:
                    URLRequest(url: Uri.parse('http://43.129.25.152:88/')));
          },
        ),
      ),
    );
  }
}
