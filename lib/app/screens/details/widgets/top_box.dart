import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class TopBoxWidget extends StatelessWidget {
  const TopBoxWidget({super.key, required this.selectedIndex});

  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homePro = Provider.of<HomeViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NewBox(
        child: NewBox(
          child: SizedBox(
            height: size.height * 0.399,
            child: Column(
              children: [
                NewBox(
                  child: CarouselSlider(
                    items: [
                      homePro.homeDatas[selectedIndex].turfImages!.turfImages1
                          .toString(),
                      homePro.homeDatas[selectedIndex].turfImages!.turfImages2
                          .toString(),
                      homePro.homeDatas[selectedIndex].turfImages!.turfImages3
                          .toString(),
                    ]
                        .map(
                          (e) => Image.network(
                            e,
                            fit: BoxFit.fill,
                            width: size.width,
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: size.height * 0.299,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pageSnapping: false,
                      clipBehavior: Clip.hardEdge,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     CircleAvatar(
                //       radius: 15,
                //       backgroundColor: Colors.grey,
                //       child: Image.network(
                //           homePro.homeDatas[selectedIndex].turfLogo!.toString()),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(
                //         homePro.homeDatas[selectedIndex].turfName.toString(),
                //         style: const TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //     const Icon(Icons.star, color: Colors.yellow),
                //   ],SS
                // )
                Expanded(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey,
                      child: Image.network(homePro
                          .homeDatas[selectedIndex].turfLogo!
                          .toString()),
                    ),
                    title: Text(
                      homePro.homeDatas[selectedIndex].turfName.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: AppColors.kRedColor,
                        ),
                        AppSizedBox.kWidth5,
                        Text(
                          homePro.homeDatas[selectedIndex].turfPlace.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kBlackColor,
                          ),
                        ),
                      ],
                    ), //const Icon(Icons.star, color: Colors.yellow),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
