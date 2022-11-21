import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../constants/query.dart';
import '../../constants/strings.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final IconData? icon;
  final Color? color;
  final Widget? child;
  const CustomButton(
      {super.key,
      this.onPressed,
      this.buttonText,
      this.color,
      this.child,
      this.transparent = false,
      this.margin,
      this.width,
      this.height,
      this.fontSize,
      this.radius = 5,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle customButtonStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).primaryColor
          : transparent
              ? Colors.transparent
              : color ?? AppColors.appBlueColor,
      minimumSize: Size(width ?? 80, height ?? 60),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );

    return SizedBox(
        width: width ?? deviceWidth(context) - 60,
        child: TextButton(
          onPressed: onPressed,
          style: customButtonStyle,
          child: child ??
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  buttonText ?? AppStrings.text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimens.px16),
                  textAlign: TextAlign.center,
                ),
              ]),
        ));
  }
}

class CustomBackButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  const CustomBackButton({
    Key? key,
    this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap ??
            () {
              FocusManager.instance.primaryFocus?.unfocus();

              Navigator.of(context).pop();
            },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
              size: Dimens.px14,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: Dimens.px14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            )
          ],
        ));
  }
}

class CircularGradientButton extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CircularGradientButton({
    Key? key,
    @required this.child,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppColors.gradiantColors),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
