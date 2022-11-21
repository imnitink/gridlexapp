import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../../constants/query.dart';

class CustomTextField extends StatefulWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function(String)? onChanged;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final IconButton? prefixIcon;
  final String? title;
  final String? hintText;
  final bool divider;
  final IconButton? suffixIcon;
  final int? maxLength;
  // final bool isHalf;
  final double? height;
  final double? width;
  final String errorText;
  final bool enableInteractiveSelection;
  final bool readOnly;
  final bool inputDecoration;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField(
      {super.key,
      this.controller,
      this.focusNode,
      this.maxLength,
      this.enableInteractiveSelection = true,
      // this.isHalf = false,
      this.title,
      this.nextFocus,
      this.isEnabled = true,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.maxLines = 1,
      this.onSubmit,
      this.inputFormatters,
      this.onChanged,
      this.prefixIcon,
      this.errorText = "",
      this.height,
      this.capitalization = TextCapitalization.none,
      this.isPassword = false,
      this.divider = false,
      this.readOnly = false,
      this.inputDecoration = true,
      this.suffixIcon,
      this.hintText,
      this.width,
      this.onPressed,
      this.icon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
        if (widget.title != null)
          Row(
            children: [
              Text(
                widget.title.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              // IconButton(
              //   onPressed: widget.onPressed,
              //   icon: Icon(
              //     widget.icon,
              //     color: Colors.red,
              //   ),
              // ),
            ],
          ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Stack(
          children: [
            Container(
              height: widget.height ?? deviceHeight(context) * 0.07,
              width: widget.width ?? MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyColor.withOpacity(0.4)),
                gradient: LinearGradient(colors: AppColors.gradiantColors),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: TextField(
                  readOnly: widget.readOnly,
                  maxLines: widget.maxLines,
                  controller: widget.controller,
                  enableInteractiveSelection: true,
                  focusNode: widget.focusNode,
                  textInputAction: widget.inputAction,
                  keyboardType: widget.inputType,
                  cursorColor: Theme.of(context).primaryColor,
                  textCapitalization: widget.capitalization,
                  enabled: widget.isEnabled,
                  autofocus: false,
                  maxLength: widget.maxLength,
                  obscureText: widget.isPassword ? _obscureText : false,
                  inputFormatters: widget.inputFormatters,
                  decoration: widget.inputDecoration
                      ? InputDecoration(
                          hintText: widget.hintText,
                          prefixIcon: widget.prefixIcon,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                style: BorderStyle.none, width: 0),
                          ),
                        )
                      : const InputDecoration(border: InputBorder.none),
                  onSubmitted: (text) => widget.nextFocus != null
                      ? FocusScope.of(context).requestFocus(widget.nextFocus)
                      : widget.onSubmit != null
                          ? (text)
                          : null,
                  onChanged: widget.onChanged,
                ),
              ),
            ),
            Positioned(
                right: 0,
                top: 5,
                child: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color:
                                Theme.of(context).hintColor.withOpacity(0.3)),
                        onPressed: _toggle,
                      )
                    : widget.suffixIcon ?? const SizedBox()),
          ],
        ),
        Text(
          widget.errorText,
          style: const TextStyle(color: Colors.red, fontSize: 13),
        )
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
