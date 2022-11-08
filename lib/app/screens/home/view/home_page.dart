import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';
import 'package:turfxbooking/app/screens/home/widgets/app_bar.dart';
import 'package:turfxbooking/app/screens/home/widgets/grid_view_builder.dart';
import 'package:turfxbooking/app/screens/home/widgets/icons_home.dart';
import 'package:turfxbooking/app/screens/shimmer/view/shimmer_widet.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).getHomeData(context);
    });
    final homePro = Provider.of<HomeViewModel>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kBackGroundColor,
        body: homePro.homeDatas.isEmpty
            ? const Center(
                child: ShimmerWidget(),
              )
            : Column(
                children: [
                  const AppBarWidget(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height * 0.60,
                      width: size.width,
                      child: const NewBox(
                        child: GridViewBuilderWidget(),
                      ),
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.kBackGroundColor,
          currentIndex: homePro.selectedIndex,
          onTap: homePro.navigatedBottomBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: HomeIcon(
                iconData: Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: HomeIcon(iconData: Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
