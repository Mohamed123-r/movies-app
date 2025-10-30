import 'package:movies_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.widget,
    this.isWidget = false,
    this.title = '',
    required this.onPressed,
  });

  final Widget widget;
  final bool isWidget;

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 54,
      minWidth: double.infinity,
      color: AppColors.tealColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: isWidget
          ? widget
          : Text(
              title,
              style: AppTextStyles.style18Medium(
                context,
              ).copyWith(color: AppColors.whiteColor),
            ),
    );
  }
}
