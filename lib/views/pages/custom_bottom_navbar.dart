// import 'package:ecommerce_app/models/product_item_model.dart';
// import 'package:ecommerce_app/services/firestore_services.dart';
// import 'package:ecommerce_app/utils/api_paths.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/views/pages/cart_page.dart';
import 'package:ecommerce_app/views/pages/favorites_page.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:ecommerce_app/views/pages/profle_page.dart';
import 'package:ecommerce_app/views/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final _firestoreService = FirestoreService.instance;
  
  @override
  void initState() {
    super.initState();
    
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const FavoritePage(),
      const CartPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: ("Favorite"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      (PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_basket),
        title: ("Cart"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      )),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: const Icon(Icons.search)),
            const SizedBox(
              width: 6,
            ),
            const Icon(Icons.notifications),
            const SizedBox(
              width: 6,
            ),
          ],
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 10,
              backgroundImage: CachedNetworkImageProvider(
                  'https://www.indiewire.com/wp-content/uploads/2019/03/151442_6876.jpg'),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Morfi',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.black,
                    ),
              ),
              Text(
                'Let\'s go shopping!',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey,
                    ),
              ),
            ],
          ),
        ),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),

          confineInSafeArea: true,
          backgroundColor: AppColors.white, 
          handleAndroidBackButtonPress: true, 
          resizeToAvoidBottomInset:
              true, 
          stateManagement:
              false, 
          hideNavigationBarWhenKeyboardShows:
              true, 
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.bounceIn,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style6,
        ));
  }
}