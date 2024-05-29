import 'package:book_store/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String text;

  const TextTitleWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: getTitleStyle(),
        ),
      ],
    );
  }
}
