import 'package:flutter/material.dart';
import 'package:marketi_app/core/constants/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final double borderRadius;
  final double borderWidth;
  final double fontSize;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isLoading;
  final bool isDisabled;
  final double height;

   const CustomOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.borderColor = AppColors.borderColor,
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.primaryColor,
    this.borderRadius = 12.0,
    this.borderWidth = 1.0,
    this.fontSize = 14,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.height = 40, // تحديد الارتفاع (كان 48 سابقاً)
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.0373),
      child: OutlinedButton(
        onPressed: (isDisabled || isLoading) ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          side: BorderSide(
            color: isDisabled ? AppColors.borderColor : borderColor,
            width: borderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding ?? const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          minimumSize: Size(double.infinity, height),
        ),
        child: isLoading
            ? SizedBox(
          height: 18,
          width: 18,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(textColor),
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            if (suffixIcon != null) ...[
              const SizedBox(width: 8),
              suffixIcon!,
            ],
          ],
        ),
      ),
    );
  }
}