// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_axtro_soft_ecommerce/utill/custom_themes.dart';

// ignore: must_be_immutable
class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintTxt;
  final FocusNode focusNode;
  final FocusNode? nextNode;
  TextInputAction? textInputAction;

  CustomPasswordTextField({
    Key? key,
    required this.controller,
    this.hintTxt,
    required this.focusNode,
    this.nextNode,
    this.textInputAction,
  }) : super(key: key);

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: TextFormField(
          cursorColor: Theme.of(context).colorScheme.primary,
          controller: widget.controller,
          obscureText: _obscureText,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          onFieldSubmitted: (v) {
            setState(() {
              widget.textInputAction == TextInputAction.done
                  ? FocusScope.of(context).consumeKeyboardToken()
                  : FocusScope.of(context).requestFocus(widget.nextNode);
            });
          },
          validator: (value) {
            return null;
          },
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: _toggle),
              hintText: widget.hintTxt ?? '',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
              isDense: true,
              filled: true,
              fillColor: Theme.of(context).highlightColor,
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary)),
              hintStyle:
                  titilliumRegular.copyWith(color: Theme.of(context).hintColor),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
