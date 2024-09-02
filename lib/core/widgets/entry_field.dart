import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color_constants.dart';

class EntryField extends StatelessWidget {
  final String? hint;
  final IconData? prefixIcon;
  final Color? color;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? readOnly;
  final TextAlign? textAlign;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final String? Function(String? value)? validator;
  final Function(String? value)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final bool? maxLengthEnforced;
  final bool? obscureText;
  final String? trailingTitle;
  final TextCapitalization? textCapitalization;
  final Function()? onTrailingTap;

  const EntryField({
    super.key,
    this.hint,
    this.prefixIcon,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.obscureText,
    this.trailingTitle,
    this.padding,
    this.validator,
    this.inputFormatter,
    this.onTrailingTap,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChange,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        label != null
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${label!}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color:Colors.black87,fontSize: 13,fontFamily:"RobotoRegular"),
                  ),
                  if (trailingTitle != null)
                    GestureDetector(
                      onTap: onTrailingTap,
                      child: Text(
                        trailingTitle ?? '',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14,
                            color: Colors.red),
                      ),
                    )
                ],
              )
            : const SizedBox.shrink(),
        const SizedBox(height:5,),
        Container(
          alignment: Alignment.center,

          height: 45,
          child: TextFormField(
            obscureText: obscureText ?? false,


            controller: controller,
            validator: validator,

            onChanged: onChange,
            initialValue: initialValue,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            readOnly: readOnly ?? false,

            maxLines: maxLines ?? 1,
            inputFormatters: inputFormatter,
            maxLength: maxLength,
            maxLengthEnforcement: maxLengthEnforced ?? false
                ? MaxLengthEnforcement.enforced
                : MaxLengthEnforcement.none,
            textAlign: textAlign ?? TextAlign.left,
            style: TextStyle(
              fontFamily:"RobotoRegular",
              fontSize: 14
            ),
            keyboardType: textInputType,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: Theme.of(context).disabledColor,size: 17,)
                  : null,
              suffixIcon: InkWell(
                  onTap: onTrailingTap,

                  child: Icon(suffixIcon, color: Theme.of(context).disabledColor,size: 20,)),
              hintText: hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color:Colors.black38,fontSize: 13),
              filled: true,
              fillColor: color??Colors.white,
              counterStyle: const TextStyle(
                height: double.minPositive,
              ),
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Border radius
                borderSide: BorderSide.none, // No border
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Border radius
                borderSide: BorderSide.none, // No border on focus
              ),

            ),
          ),
        ),
        const SizedBox(height:15,),
      ],
    );
  }
}
class EntryBigField extends StatelessWidget {
  final String? hint;
  final IconData? prefixIcon;
  final Color? color;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? readOnly;
  final TextAlign? textAlign;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? padding;
  final String? Function(String? value)? validator;
  final Function(String? value)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final bool? maxLengthEnforced;
  final bool? obscureText;
  final String? trailingTitle;
  final Iterable<String>? autoFillType;
  final TextCapitalization? textCapitalization;
  final Function()? onTrailingTap;

  const EntryBigField({
    super.key,
    this.hint,
    this.prefixIcon,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.autoFillType,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.obscureText,
    this.trailingTitle,
    this.padding,
    this.validator,
    this.inputFormatter,
    this.onTrailingTap,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChange,
    this.minLines,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        label != null
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${label!}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color:Colors.black87,fontSize: 13,fontFamily:"RobotoRegular"),
            ),
            if (trailingTitle != null)
              GestureDetector(
                onTap: onTrailingTap,
                child: Text(
                  trailingTitle ?? '',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14,
                      color: Colors.red),
                ),
              )
          ],
        )
            : const SizedBox.shrink(),
        const SizedBox(height:5,),
        TextFormField(
          obscureText: obscureText ?? false,
          autofillHints: autoFillType,

          controller: controller,
          validator: validator,

          onChanged: onChange,
          minLines: minLines,
          initialValue: initialValue,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          readOnly: readOnly ?? false,

          maxLines: maxLines ?? 1,
          inputFormatters: inputFormatter,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforced ?? false
              ? MaxLengthEnforcement.enforced
              : MaxLengthEnforcement.none,
          textAlign: textAlign ?? TextAlign.left,
          style: TextStyle(
              fontFamily:"RobotoRegular",
              fontSize: 14
          ),
          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: Theme.of(context).disabledColor,size: 17,)
                : null,
            suffixIcon: InkWell(
                onTap: onTrailingTap,

                child: Icon(suffixIcon, color: Theme.of(context).disabledColor,size: 20,)),
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color:Colors.black38,fontSize: 13),
            filled: true,
            fillColor: color??Colors.white,
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Border radius
              borderSide: BorderSide.none, // No border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Border radius
              borderSide: BorderSide.none, // No border on focus
            ),

          ),
        ),
        const SizedBox(height:15,),
      ],
    );
  }
}
