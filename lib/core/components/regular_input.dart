import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/core/core.dart';

class RegularInput extends StatelessWidget {
  const RegularInput({
    this.obscureText = false,
    this.focusNode,
    this.hintText,
    this.suffix,
    this.prefixIcon,
    this.controller,
    this.background,
    this.errorText,
    this.minLine = 1,
    this.maxLine = 1,
    this.onChange,
    this.onSubmit,
    this.inputAction,
    this.style,
    this.inputType,
    this.enable = true,
    this.onTap,
    this.readOnly,
    this.inputFormatters,
    this.maxLength,
    this.autoFocus,
    this.label,
    this.prefix,
    this.isRequired,
    this.textColor,
    Key? key,
  }) : super(key: key);

  final IconData? prefixIcon;
  final bool enable;
  final bool? obscureText, readOnly;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText, errorText;
  final Widget? suffix;
  final Color? background;
  final int minLine, maxLine;
  final ValueChanged<String>? onChange, onSubmit;
  final TextInputAction? inputAction;
  final TextStyle? style;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool? autoFocus;
  final String? label;
  final Widget? prefix;
  final bool? isRequired;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final disabledColor = !enable ? AppColors.secondaryColor : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(
          label: label,
          isRequired: isRequired,
        ),
        Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(size: Dimens.dp10),
            primaryColor: Colors.black,
          ),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText ?? false,
            minLines: minLine,
            maxLines: maxLine,
            maxLength: maxLength,
            onChanged: onChange,
            onFieldSubmitted: onSubmit,
            textInputAction: inputAction ?? TextInputAction.done,
            style: style ??
                TextStyle(
                  fontSize: Dimens.dp14,
                  fontWeight: FontWeight.normal,
                  color: disabledColor ?? textColor,
                ),
            keyboardType: inputType,
            enabled: enable,
            onTap: onTap,
            readOnly: readOnly ?? false,
            inputFormatters: inputFormatters,
            autofocus: autoFocus ?? false,
            decoration: InputDecoration(
              prefixIcon: (prefix != null && prefixIcon == null)
                  ? prefix
                  : (prefixIcon != null
                      ? Icon(
                          prefixIcon,
                          color: disabledColor ?? textColor,
                        )
                      : null),
              counterText: '',
              fillColor: background ?? disabledColor?.withOpacity(0.2),
              hintText: hintText ?? '',
              hintStyle: TextStyle(color: textColor),
              errorText: errorText,
              suffixIcon: suffix,
            ),
          ),
        ),
      ],
    );
  }
}
