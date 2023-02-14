import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app_styles.dart';
import 'package:flutter_news_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kLighterWhite,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 50,
                child: Stack(
                  children: [
                    const FullScreenSlider(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(42),
                              topRight: Radius.circular(42),
                            ),
                            color: kLighterWhite),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kPaddingHorizontal, vertical: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  border: Border.all(color: kWhite)),
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                  'assets/arrow_back_icon.svg'),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kBorderRadius),
                                  border: Border.all(color: kWhite)),
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                  'assets/bookmark_white_icon.svg'),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
                transform: Matrix4.translationValues(0, -14, 0),
                child: Text(
                  'Unravel mysteries\nof the Maldives',
                  style: kPoppinsBold.copyWith(
                      color: kDarkBlue,
                      fontSize: SizeConfig.blockSizeHorizontal! * 7),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: kPaddingHorizontal, vertical: 16),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal! * 2.5),
                height: 54,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    border: Border.all(color: kBorderColor)),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 13,
                      backgroundColor: kBlue,
                      backgroundImage: NetworkImage(
                          'https://cdn3d.iconscout.com/3d/premium/thumb/cute-boy-avatar-5460344-4544330.png'),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 2.5,
                    ),
                    Text(
                      'Keanu Carpent May 17 • 8 min read',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kPoppinsRegular.copyWith(
                          color: kGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
                child: Text(
                  'Torii é um dos símbolos mais emblemáticos do Japão, presentes em diversos monumentos e paisagens de tirar o fôlego, desde templos históricos a jardins exuberantes. Esse tradicional portal vermelho de estilo shintoísta é uma estrutura imponente que marca a transição do mundo profano para o sagrado.\n\nO torii é feito de dois pilares verticais conectados por duas vigas horizontais e normalmente é pintado de vermelho brilhante. O design elegante e icônico do torii foi estabelecido há séculos e é considerado uma obra-prima da arquitetura japonesa. Alguns torii são imensos e podem ser vistos a quilômetros de distância, enquanto outros são menores e mais discretos, integrando-se perfeitamente com o ambiente natural. Independentemente do tamanho, o torii é sempre um objeto de grande admiração e fascínio para os visitantes do Japão.',
                  style: kPoppinsMedium.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    color: kDarkBlue,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

final List<String> imageList = [
  'https://images.unsplash.com/photo-1528360983277-13d401cdc186?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1480796927426-f609979314bd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1554797589-7241bb691973?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80'
];

class FullScreenSlider extends StatefulWidget {
  const FullScreenSlider({Key? key}) : super(key: key);

  @override
  State<FullScreenSlider> createState() => _FullScreenSliderState();
}

class _FullScreenSliderState extends State<FullScreenSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              height: SizeConfig.blockSizeVertical! * 50,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              initialPage: _current),
          items: imageList
              .map((item) => Center(
                    child: Image.network(item,
                        fit: BoxFit.cover,
                        height: SizeConfig.blockSizeVertical! * 50,
                        width: double.infinity),
                  ))
              .toList()),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 52),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList
                    .asMap()
                    .entries
                    .map((entry) => GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: SvgPicture.asset(_current == entry.key
                                ? 'assets/carousel_indicator_enabled.svg'
                                : 'assets/carousel_indicator_disabled.svg'),
                          ),
                        ))
                    .toList())),
      )
    ]);
  }
}
