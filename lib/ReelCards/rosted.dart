import 'package:flutter/material.dart';

import '../app_large_text.dart';
import '../app_text.dart';


class NameCard2 extends StatelessWidget {
  const NameCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
      ),
      elevation: 4,
      color: Colors.white,
      margin:  const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset('assets/images/rosted.png',
                height: 290,
                width: 180,
                fit: BoxFit.cover),
          ),
          const SizedBox(height: 8,),
          AppLargeText(text: 'Rosted Delights',size: 11,),
          AppText(text: 'BBQ house', size: 10,)
        ],
      ),
    );
  }
}
