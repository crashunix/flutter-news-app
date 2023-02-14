import 'package:flutter/material.dart';
import 'package:flutter_news_app/news_detail_page.dart';
import 'app_styles.dart';
import 'size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: kLighterWhite,
          body: const NewsDetailScreen(),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: kWhite,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: _selectedIndex == 0
                      ? SvgPicture.asset('assets/home_selected_icon.svg')
                      : SvgPicture.asset('assets/home_unselected_icon.svg'),
                  label: ''),
              BottomNavigationBarItem(
                  icon: _selectedIndex == 1
                      ? SvgPicture.asset('assets/bookmark_selected_icon.svg')
                      : SvgPicture.asset('assets/bookmark_unselected_icon.svg'),
                  label: ''),
              BottomNavigationBarItem(
                  icon: _selectedIndex == 2
                      ? SvgPicture.asset(
                          'assets/notification_selected_icon.svg')
                      : SvgPicture.asset(
                          'assets/notification_unselected_icon.svg'),
                  label: ''),
              BottomNavigationBarItem(
                  icon: _selectedIndex == 3
                      ? SvgPicture.asset('assets/profile_selected_icon.svg')
                      : SvgPicture.asset('assets/profile_unselected_icon.svg'),
                  label: ''),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          Row(
            children: [
              Container(
                height: 51,
                width: 51,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kLightBlue,
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://cdn3d.iconscout.com/3d/premium/thumb/woman-avatar-6299541-5187873.png'))),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back!',
                      style: kPoppinsBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      )),
                  Text('Monday, 3 October',
                      style: kPoppinsRegular.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      )),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: kWhite,
                boxShadow: [
                  BoxShadow(
                      color: kDarkBlue.withOpacity(0.051),
                      offset: const Offset(0.0, 3.0),
                      blurRadius: 24.0,
                      spreadRadius: 0.0)
                ]),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                        style: kPoppinsRegular.copyWith(
                            color: kBlue,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3),
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 13),
                            hintText: 'Search for article...',
                            border: kBorder,
                            errorBorder: kBorder,
                            disabledBorder: kBorder,
                            focusedBorder: kBorder,
                            focusedErrorBorder: kBorder,
                            hintStyle: kPoppinsRegular.copyWith(
                              color: kLightGrey,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            )))),
                Container(
                  decoration: BoxDecoration(
                      color: kBlue,
                      borderRadius: BorderRadius.circular(kBorderRadius)),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/search_icon.svg')),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
              height: 14,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 38),
                    child: Text(
                      '#Health',
                      style: kPoppinsMedium.copyWith(
                          color: kGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3),
                    ),
                  );
                },
              )),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 304,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(right: 20),
                  height: 304,
                  width: 255,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kWhite,
                    boxShadow: [
                      BoxShadow(
                          color: kDarkBlue.withOpacity(0.051),
                          offset: const Offset(0.0, 3.0),
                          blurRadius: 24.0,
                          spreadRadius: 0.0)
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 164,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://www.state.gov/wp-content/uploads/2019/04/Japan-2107x1406.jpg'))),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Flexible(
                          child: Text(
                        'A incrível jornada pelos Toriis: descubra a história e a beleza desses portões no Japão',
                        style: kPoppinsBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 19,
                                backgroundColor: kLightBlue,
                                backgroundImage: NetworkImage(
                                    'https://preview.redd.it/ai25gmzs3bt61.png?width=640&crop=smart&auto=webp&s=fa6d26c3057a122a6d22520f19431b90fa267d0d'),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Saya Hiyama',
                                    style: kPoppinsSemiBold.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3),
                                  ),
                                  Text(
                                    'Sep 9, 2022',
                                    style: kPoppinsRegular.copyWith(
                                        color: kGrey,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                              width: 38,
                              height: 38,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  color: kLightWhite),
                              child: SvgPicture.asset('assets/share_icon.svg'))
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Short for You',
                style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                ),
              ),
              Text(
                'View all',
                style: kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 19,
          ),
          SizedBox(
            height: 88,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(9),
                  margin: const EdgeInsets.only(right: 20),
                  width: 208,
                  height: 88,
                  decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      boxShadow: [
                        BoxShadow(
                            color: kDarkBlue.withOpacity(0.051),
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 24.0,
                            spreadRadius: 0.0)
                      ]),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        padding: const EdgeInsets.all(26),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://www.history.com/.image/ar_16:9%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cg_faces:center%2Cq_auto:good%2Cw_768/MTk0OTU3Mjc5NTE3MjIyMDUw/gettyimages-1390815938.jpg'))),
                        child: SvgPicture.asset('assets/play_icon.svg'),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Top Trending Island in 2022',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: kPoppinsSemiBold.copyWith(
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 3.5),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/eye_icon.svg'),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '40,999',
                                style: kPoppinsMedium.copyWith(
                                    color: kGrey,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3),
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
