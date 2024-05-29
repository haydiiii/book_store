import 'package:book_store/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello , User',
              style: getTitleStyle(),
            ),
            Text(
              'What are you reading today? ',
              style: getBodyStyle(),
            )
          ],
        ),
        const Spacer(),
        // CircleAvatar(
        //   radius: 20,
        //   backgroundImage:  AssetImage(ImagesAssets.image1),
        // )
      ],
    );
  }
}
