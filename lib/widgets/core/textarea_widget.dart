import 'package:flutter/material.dart';

import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/constants/text_style.dart';

class TextAreaWidget extends StatefulWidget {
  const TextAreaWidget(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  _TextAreaWidgetState createState() => _TextAreaWidgetState();
}

class _TextAreaWidgetState extends State<TextAreaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            maxLines: 6,
            minLines: 6,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Dimens.md_padding, vertical: Dimens.md_padding),
              filled: true,
              fillColor: Color(0xFFFFFFFF),
              hintText: widget.hintText,
              hintStyle: TextStyles.searchBar['hint'],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1E1E1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.colors['systemColor'] as Color),
                borderRadius: BorderRadius.circular(6),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
