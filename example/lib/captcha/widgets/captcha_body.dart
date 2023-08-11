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
  bool hasBigSize = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: hasBigSize ? 500 : 90, //90 for smaller notice, 500 for bigger one
      width: MediaQuery.of(context).size.width - 32,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InAppWebView(
        // initialFile: 'assets/index.html',
        // initialUrlRequest:
        //     URLRequest(url: Uri.parse('https://flutter-ecom-776db.web.app/')),
        onWebViewCreated: (controller) {
          controller.loadUrl(
              urlRequest: URLRequest(
                  url: Uri.parse(
                      'http://127.0.0.1:5500/web/public/index.html')));

          controller.addJavaScriptHandler(
              handlerName: 'grecaptchaCallback',
              callback: (args) async {
                // Here you receive all the arguments from the JavaScript side
                // that is a List<dynamic>
                debugPrint('From the JavaScript side:');
                debugPrint(
                  'token: ${args.first}',
                );
              });
        },
        onWindowBlur: (controller) {
          setState(() {
            hasBigSize = !hasBigSize;
          });
        },
      ),
    );
  }

  Future<void> isSuccessed(BuildContext context, bool value) async {
    await Future.delayed(const Duration(seconds: 2));
    if (value) {
      Navigator.pop(context);
    } else {
      print('Fail');
    }
  }
}
