import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

class CustomObscurableFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final IconData prefixIcon;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final bool isAlwaysObsucured;
  final Function(String?) validator;
  final bool showLabel;
  final String? intialValue;
  final bool isEnabled;
  const CustomObscurableFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      required this.prefixIcon,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.backgroundColor,
      this.controller,
      required this.validator,
      this.showLabel = false,
      this.isAlwaysObsucured = false,
      this.isEnabled = false,
      this.intialValue});

  @override
  State<CustomObscurableFormField> createState() =>
      _CustomObscurableFormFieldState();
}

class _CustomObscurableFormFieldState extends State<CustomObscurableFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      initialValue: widget.intialValue,
      controller: widget.controller,
      obscureText: (widget.isAlwaysObsucured == true) ? true : isObscure,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        labelText: (widget.showLabel == true) ? widget.hintText : null,
        //! Use [suffixIcon] instead of [suffix]
        suffixIcon: (widget.isAlwaysObsucured == false)
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  (isObscure) ? Icons.visibility : Icons.visibility_off,
                  color: Constants.colorGrey,
                ))
            : null,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Constants.colorGrey, fontWeight: FontWeight.w300),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Constants.colorGrey,
        ),
        isDense: true,
        contentPadding: widget.contentPadding ?? Constants.paddingSmall,
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Constants.colorLightGrey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        enabledBorder: widget.enabledBorder ??
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

        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Constants.colorLightGrey,
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
        hintText: widget.hintText,
        fillColor: widget.backgroundColor ??
            ((getIt<UserBusinessInterface>().userPreferences?.theme ??
                        ThemeMode.light) ==
                    ThemeMode.light
                ? Constants.colorWhiteLessSmoke
                : Constants.colorBlack),
        filled: true,
      ),
      style: Theme.of(context).textTheme.bodyMedium!,
      validator: (value) {
        return widget.validator(value);
      },
    );
  }
}
