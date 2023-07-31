import 'package:flutter/material.dart';

class DialogContainerWidget extends StatelessWidget {
  final Widget child;

  const DialogContainerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF696969)),
            borderRadius: BorderRadiusDirectional.circular(16),
            color: Colors.white,
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}

class DialogContainerNoramlWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? marginContent;
  final EdgeInsets? paddingContent;
  final double? borderRadius;

  const DialogContainerNoramlWidget(
      {Key? key,
      required this.child,
      this.marginContent,
      this.paddingContent,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              margin: marginContent ?? const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF696969)),
                borderRadius:
                    BorderRadiusDirectional.circular(borderRadius ?? 5),
                color: Colors.white,
              ),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                padding: paddingContent ?? const EdgeInsets.all(16),
                child: child,
              ),
            ),
            Positioned(
              top: 8,
              right: 30,
              child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: const Center(
                    child: FittedBox(
                      child: Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
