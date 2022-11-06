import 'dart:ui';

import 'package:flutter/material.dart';
import 'AdBanner.dart';
import 'ImageCard/FilterBox.dart';
import 'ImageCard/ImageCard.dart';
import 'ProfilePage.dart';
import 'ReelCards/dimsum.dart';
import 'ReelCards/rosted.dart';
import 'app_large_text.dart';
import 'app_text.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      drawer: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 10,
          sigmaX: 10,
        ),
        child: Drawer(
          elevation: 10,
          backgroundColor: Colors.white,
          child: Center(
            child: ListView(
              children: [
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/Orangefont.png',
                      height: 30,
                    ),
                    const SizedBox(
                      width: 75,
                    ),
                    Container(
                      height: 60,
                      width: 20,
                      decoration: const BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState
                              ?.closeDrawer();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
                MaterialButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
                    );
                  },
                  child: Container(
                    height: 130,
                    width: 230,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black)),
                    child: Column(
                      children: [
                        AppLargeText(
                          text: 'Profile',
                          size: 12,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const CircleAvatar(
                              backgroundColor: const Color(0xffEEABFF),
                              radius: 45.0,
                              child:  CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                  'assets/images/shelly.png',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                AppLargeText(
                                  text: 'Shelly007',
                                  size: 20,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                AppText(
                                  text: '5400 Followers',
                                  size: 13,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AppLargeText(
                  text: 'Menu',
                  size: 12,
                  color: Colors.grey.shade700,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(color: Colors.orange),
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15),
                        child: AppText(
                          text: 'New Delhi',
                          size: 15,
                          color: Colors.orange,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15),
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.orange,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    AppText(text: 'Veg only'),
                    const SizedBox(
                      width: 150,
                    ),
                    Icon(
                      Icons.toggle_off_outlined,
                      color: Colors.grey.shade700,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.cookie,
                      color: Colors.grey.shade700,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    AppText(text: 'Preferences'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.qr_code_sharp,
                      color: Colors.grey.shade700,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    AppText(text: 'Scan QR'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.email,
                      color: Colors.grey.shade700,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    AppText(text: 'Contact us'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.grey.shade700,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    AppText(text: 'Settings'),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Container(
                            height: 90,
                            width: 140,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 8.0,
                                ),
                              ],
                              borderRadius:
                              BorderRadius.circular(24),
                              gradient: const LinearGradient(colors: [
                                Color(0xffFDBD19),
                                Color(0xffFF9707)
                              ]),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                AppLargeText(
                                  text: 'New Post',
                                  size: 15,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.add_circle_rounded,
                                  size: 35,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.5),
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.orange,
            size: 35,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/Orangefont.png',
              height: 25,
            ),
          ],
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(),
          ),
        ),
      ),
      body: Stack(
          children:[
            ListView(children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.explore,
                          size: 35,
                          color: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AppLargeText(
                          text: "Explore",
                          color: Colors.grey.shade700,
                          size: 20,
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              color: Colors.orange,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            AppText(
                              text: 'New Delhi',
                              size: 15,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Container(
                height: 350,
                color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    NameCard(),
                    NameCard2(),
                    NameCard(),
                    NameCard(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: 'Filter Content',
                      size: 16,
                      color: Colors.black54,
                    ),
                    AppText(
                      text: "See all",
                      color: Colors.grey.shade700,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const FilterContent(),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  AppLargeText(
                    text: 'Featured Dishes',
                    size: 15,
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column( children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        AdBanner(),
                        ImageCard(),
                        ImageCard(),
                      ],
                    ),
                    Column(
                      children: const [
                        ImageCard(),
                        ImageCard(),
                        AdBanner(),
                      ],
                    )
                  ],
                ),
              ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 4,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset('assets/images/MapFrame.png',
                              height: 250, width: 390, fit: BoxFit.fitWidth),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100,)
            ],
            ),
          ]
      ),
      extendBody: true,
    );
  }
}
