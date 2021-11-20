import 'package:flutter/material.dart';

import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/constants/text_style.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({
    Key? key,
    required this.hintText,
    required this.controller
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  _TextfieldWidgetState createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: Dimens.md_padding),
                filled: true,
                fillColor: Color(0xFFFFFFFF),
                hintText: widget.hintText,
                hintStyle: TextStyles.searchBar['hint'],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.colors['systemColor'] as Color),
                  borderRadius: BorderRadius.circular(6),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
