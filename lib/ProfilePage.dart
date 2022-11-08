import 'dart:ui';
import 'package:flutter/material.dart';
import 'ReelCards/FilterCard.dart';
import 'ReelCards/dimsum.dart';
import 'ReelCards/rosted.dart';
import 'app_large_text.dart';
import 'app_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.3),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'My Profile',
                size: 20,
              ),
              Image.asset(
                'assets/images/Orangefont.png',
                height: 30,
              ),
            ],
          )),
      body: ListView(
        children: [
          Stack(children: [
            Column(children: [
              Image.asset(
                'assets/images/FoodBg.png',
                height: 200,
                width: double.maxFinite,
                fit: BoxFit.fitWidth,
              ),
              Container()
            ]),
            Column(
              children: [
                const SizedBox(height: 100),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 6,
                        )
                      ]),
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        AppLargeText(
                          text: 'Shelly007',
                          size: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade100,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                AppText(
                                  text: 'A bowl of noodle can make my day!',
                                  size: 12,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(
                                  Icons.edit,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xffFDBD19), Color(0xffFF9707)]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          height: 20,
                          child: Center(
                            child: AppLargeText(
                              text: 'Food Style',
                              size: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(color: Colors.orange),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: const [
                                SizedBox(
                                  width: 10,
                                ),
                                FilterCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                FilterCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                FilterCard(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: 5,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1 / 1.8),
                          itemBuilder: (BuildContext context, int index) {
                            return const NameCard2();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(color: Colors.black54, blurRadius: 7)
                        ]),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xffEEABFF),
                      radius: 60,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('assets/images/shelly.png'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
