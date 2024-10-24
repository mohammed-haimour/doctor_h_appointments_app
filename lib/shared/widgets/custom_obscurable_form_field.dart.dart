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
  final Function(String?) validator;
  const CustomObscurableFormField({
    super.key,
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
  });

  @override
  State<CustomObscurableFormField> createState() => _CustomObscurableFormFieldState();
}

class _CustomObscurableFormFieldState extends State<CustomObscurableFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isObscure,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        //! Use [suffixIcon] instead of [suffix]
        suffixIcon: GestureDetector(onTap: (){setState(() {isObscure = !isObscure;});} , child: Icon((isObscure) ? Icons.visibility : Icons.visibility_off , color: Constants.colorGrey,)),
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Constants.colorGrey ,fontWeight: FontWeight.w300),
        prefixIcon: Icon(widget.prefixIcon , color: Constants.colorGrey,),
        isDense: true,
        contentPadding: widget.contentPadding ??
            Constants.paddingSmall,
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
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        // hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: widget.hintText,
        fillColor: widget.backgroundColor ?? Constants.colorWhiteLessSmoke,
        filled: true,
      ),
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Constants.colorLightBlack),
      validator: (value) {
        return widget.validator(value);
      },
    );
  }
}