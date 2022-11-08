import 'package:flutter/material.dart';


class ImageCard2 extends StatelessWidget {
  const ImageCard2 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset('assets/images/rosted.png',
                  height: 200,
                  width: 130,
                  fit: BoxFit.cover),
            )
        ),
      ],
    );
  }
}
