import 'package:flutter/material.dart';
import '../ReelCards/FilterCard.dart';
import '../app_large_text.dart';

class FilterContent extends StatelessWidget {
  const FilterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 1000,
              width: 300,
              color: Colors.white.withOpacity(0.2),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    const Text('Modal BottomSheet'),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xffFDBD19), Color(0xffFF9707)]
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 20,),
                  AppLargeText(text: 'What are you craving?',
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.cookie,
                    color: Colors.white,),
                  SizedBox(width: 24,),
                ],
              )
            ],
          ),
            const SizedBox(height: 15,),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  FilterCard(),
                  FilterCard(),
                  FilterCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
