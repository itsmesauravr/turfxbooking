import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/details/view/details_page.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class GridViewBuilderWidget extends StatelessWidget {
  const GridViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeViewModel>(context);
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: homePro.homeDatas.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              int selectedIndex = index;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    selectedIndex: selectedIndex,
                  ),
                ),
              );
            },
            child: NewBox(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.199,
                    child: NewBox(
                      child: CarouselSlider(
                        items: [
                          homePro.homeDatas[index].turfImages!.turfImages1
                              .toString(),
                          homePro.homeDatas[index].turfImages!.turfImages2
                              .toString(),
                          homePro.homeDatas[index].turfImages!.turfImages3
                              .toString(),
                        ]
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.cover,
                                width: size.width,
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: size.height * 0.999,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          clipBehavior: Clip.hardEdge,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ),
                  AppSizedBox.kHeight10,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          homePro.homeDatas[index].turfCategory!.turfBadminton!
                              ? Icons.sports_tennis_outlined
                              : homePro.homeDatas[index].turfCategory!
                                      .turfCricket!
                                  ? Icons.sports_cricket_outlined
                                  : homePro.homeDatas[index].turfCategory!
                                          .turfFootball!
                                      ? Icons.sports_soccer_outlined
                                      : Icons.cancel_outlined,
                          size: 14,
                          color: AppColors.kRedColor,
                        ),
                        Text(
                          homePro.homeDatas[index].turfName.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kBlackColor,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.yellow.shade800,
                            ),
                            Text(
                              homePro.homeDatas[index].turfInfo!.turfRating
                                  .toString(),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kBlackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
