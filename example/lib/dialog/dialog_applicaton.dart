import 'package:flutter/material.dart';

import 'widgets/dialog_container_widget.dart';

const blurValue = 3.0;
const durationShowDialogAnimation = Duration(milliseconds: 400);
final tweenShowDialogAnimation = Tween<double>(begin: 0.0, end: blurValue);

Widget _transitionBuilderDialog(context, a1, a2, child) {
  final value = tweenShowDialogAnimation.animate(a1);
  return Opacity(
    opacity: value.value / blurValue,
    child: child,
  );
  // return BackdropFilter(
  //   filter: ImageFilter.blur(sigmaX: value.value, sigmaY: value.value),
  //   child: Opacity(
  //     opacity: value.value / blurValue,
  //     child: child,
  //   ),
  // );
}

Future<T?> showDialogNormal<T>(
  BuildContext context, {
  Color? barrierColor,
  bool isDismissible = false,
  EdgeInsets? paddingContent,
  EdgeInsets? marginContent,
  double? borderRadius,
  required Widget body,
}) {
  final colorBarrier = barrierColor ?? Colors.black45;

  return showGeneralDialog<T>(
    context: context,
    barrierColor: colorBarrier,
    barrierDismissible: isDismissible,
    transitionBuilder: _transitionBuilderDialog,
    transitionDuration: durationShowDialogAnimation,
    pageBuilder: (context, animation1, animation2) {
      return DialogContainerNoramlWidget(
        paddingContent: paddingContent,
        marginContent: marginContent,
        borderRadius: borderRadius,
        child: SizedBox(width: double.infinity, child: body),
      );
    },
  );
}

