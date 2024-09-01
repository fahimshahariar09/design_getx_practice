import 'package:design/view/common_widget/common_text.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key,
      required this.buttonName,
      this.fColor,
      this.textColor,
      this.buttonHeight,
      this.buttonWidth,
      required this.onTab});

  final String buttonName;
  final Color? fColor;
  final Color? textColor;
  final double? buttonHeight;
  final double? buttonWidth;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Card(
        color: fColor ?? Colors.orange,
        child: SizedBox(
          height: buttonHeight ?? 50,
          width: buttonWidth ?? MediaQuery.sizeOf(context).width,
          child: Center(child: CommonText(titel: buttonName,fColor: textColor ?? Colors.cyan,fSize: 18,)),
        ),
      ),
    );
  }
}
