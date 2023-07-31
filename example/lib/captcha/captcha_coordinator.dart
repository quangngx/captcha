import 'package:example/dialog/dialog_applicaton.dart';
import 'package:flutter/material.dart';

import 'widgets/captcha_body.dart';


extension CoordinatorCaptchaBuildContext on BuildContext {
  Future<T?> startDiaglogCaptcha<T>() {
    return showDialogNormal(
      this,
      body: const CaptchaBody(),
    );
  }
}
