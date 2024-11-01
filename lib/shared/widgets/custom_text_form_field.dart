import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final IconData prefixIcon;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? intialValue;
  final bool showLabel;
  final Function(String?) validator;
  final bool isEnabled;
  const CustomTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    required this.prefixIcon,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.showLabel = false,
    this.intialValue,
    this.isEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: (intialValue != null) ? intialValue : null,
      controller: controller,
      enabled: isEnabled,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        labelText: (showLabel == true) ? hintText : null,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Constants.colorGrey, fontWeight: FontWeight.w300),
        prefixIcon: Icon(
          prefixIcon,
          color: Constants.colorGrey,
        ),
        isDense: true,
        contentPadding: contentPadding ?? Constants.paddingSmall,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Constants.colorLightGrey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),

        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Constants.colorLightGrey,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Constants.colorLightGrey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        // hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ??
            ((getIt<UserBusinessInterface>().userPreferences?.theme ??
                        ThemeMode.light) ==
                    ThemeMode.light
                ? Constants.colorWhiteLessSmoke
                : Constants.colorBlack),
        filled: true,
      ),
      style: Theme.of(context).textTheme.bodyMedium!,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
