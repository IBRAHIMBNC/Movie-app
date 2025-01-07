import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/utils/ui_helpers.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final AutovalidateMode? autoValidationMode;
  final String hinText;
  final Color? bgColor;
  final bool isPassword;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final Function(String? val)? onSave;
  final Size size;
  final String? suffixText;
  final int? minLines;
  final bool readOnly;
  final TextEditingController? controller;
  final int? lines;
  final bool obscureText;
  final Function(String? value)? onChanged;
  final String? prefixIcon;
  final Function()? onTap;
  final bool isUnderlineBorder;
  final Color? borderColor;
  final Widget? prefix;
  final EdgeInsetsGeometry? prefixIconPadding;

  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;
  final String? errorText;
  final bool isDisabled;
  final double? verticalPadding;
  final EdgeInsetsGeometry? margin;
  final Color? fontColor;

  final Widget? suffixWidget;

  const CustomTextField({
    super.key,
    required this.hinText,
    this.isPassword = false,
    this.onSave,
    this.validator,
    this.bgColor,
    this.borderRadius = 50,
    this.size = const Size(95, 6),
    this.keyboardType = TextInputType.text,
    this.controller,
    this.autoValidationMode = AutovalidateMode.onUserInteraction,
    this.lines,
    this.onChanged,
    this.suffixText,
    this.onTap,
    this.minLines,
    this.readOnly = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixWidget,
    this.prefix,
    this.prefixIconPadding,
    this.isUnderlineBorder = false,
    this.borderColor,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.errorText,
    this.isDisabled = false,
    this.verticalPadding,
    this.margin,
    this.fontColor,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;
  bool showErrorMessage = false;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    isVisible = widget.isPassword;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: AppColors.blackColor.withOpacity(0.03),
            offset: const Offset(4, 4),
            blurRadius: 20,
            spreadRadius: 0)
      ]),
      margin: widget.margin ?? EdgeInsets.only(bottom: 0.015.sh),
      width: widget.size.width.sw,
      child: TextFormField(
          focusNode: _focusNode,
          minLines: widget.minLines,
          onTap: widget.isDisabled ? null : widget.onTap,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: (value) => widget.onChanged?.call(value),
          readOnly: widget.readOnly,
          maxLines: widget.lines ?? 1,
          style: GoogleFonts.poppins(
              fontSize: 16.sp,
              color: widget.fontColor ??
                  Theme.of(context).textTheme.bodyMedium!.color,
              fontWeight: FontWeight.w400),
          autovalidateMode: widget.autoValidationMode,
          controller: widget.controller,
          validator: widget.validator,
          onSaved: widget.onSave,
          keyboardType: widget.keyboardType,
          obscureText: isVisible,
          cursorColor: AppColors.greyColor,
          inputFormatters: [
            if (widget.keyboardType == TextInputType.number)
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            if (widget.keyboardType == TextInputType.number)
              CurrencyInputFormatter(),
          ],
          decoration: InputDecoration(
              errorText: showErrorMessage ? widget.errorText : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: kPadding20.w,
                vertical: widget.verticalPadding ?? 16.h,
              ),
              filled: true,
              fillColor: widget.bgColor ?? AppColors.lightGreyColor,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14.sp, color: AppColors.greyColor),
              hintText: widget.hinText,
              errorStyle: GoogleFonts.poppins(fontSize: 12.sp),
              constraints: BoxConstraints(
                minHeight: widget.size.height.h,
              ),
              alignLabelWithHint: true,
              suffixText: widget.suffixText,
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  borderSide: const BorderSide(color: Colors.red)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  borderSide: const BorderSide(color: Colors.red)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  borderSide: BorderSide(
                      color: widget.borderColor ??
                          AppColors.blackColor.withOpacity(0.05))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  borderSide: BorderSide(
                      color: widget.borderColor ??
                          AppColors.blackColor.withOpacity(0.05))),
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Padding(
                      padding: widget.prefixIconPadding ??
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: kPadding12),
                      child: SvgPicture.asset(
                        widget.prefixIcon.toString(),
                        height: 22.sp,
                        width: 22.sp,
                      ),
                    ),
              suffixIcon: widget.suffixWidget)),
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.decimalPattern();

    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
