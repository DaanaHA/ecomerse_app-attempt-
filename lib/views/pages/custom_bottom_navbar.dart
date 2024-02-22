import 'package:ecommerce_app/utils/app_assets.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:ecommerce_app/views/pages/cart_page.dart';
import 'package:ecommerce_app/views/pages/favorites_page.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:ecommerce_app/views/pages/login_page.dart';
import 'package:ecommerce_app/views/pages/profile_page.dart';



class CustomBottombarNavbar extends StatefulWidget {
  const CustomBottombarNavbar({super.key});

  @override
  State<CustomBottombarNavbar> createState() => _CustomBottombarNavbarState();
}

class _CustomBottombarNavbarState extends State<CustomBottombarNavbar> {

late PersistentTabController _controller;

@override
void  initState(){
  super.initState();
  _controller = PersistentTabController();
}

List<Widget> _buildScreens() {
        return [
          const HomePage(),
          const FavoritsPage(),
          const CartPage(),
          const ProfilePage()

        ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: AppColors.primary,
                inactiveColorPrimary: AppColors.grey,
            ),
            
              PersistentBottomNavBarItem(
                inactiveIcon:const Icon(CupertinoIcons.square_favorites_alt),
                icon: const Icon(CupertinoIcons.square_favorites_alt_fill),
                title: ("Favorite"),
                activeColorPrimary: AppColors.primary,
                inactiveColorPrimary: AppColors.grey,
            ),
              PersistentBottomNavBarItem(
                inactiveIcon:const Icon(Icons.shopping_bag_outlined),
                icon: const Icon(Icons.shopping_bag),
                title: ("Cart"),
                activeColorPrimary: AppColors.primary,
                inactiveColorPrimary: AppColors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.settings_applications_sharp),
                inactiveIcon:const Icon (Icons.settings_applications_outlined),
                title: ("Settings"),
                activeColorPrimary: AppColors.primary,
                inactiveColorPrimary: AppColors.grey,
            ),
             PersistentBottomNavBarItem(
                inactiveIcon:const Icon(Icons.person_2_outlined),
                icon: const Icon(Icons.person_2),
                title: ("Profile"),
                activeColorPrimary: AppColors.primary,
                inactiveColorPrimary: AppColors.grey,
            ),
        ];
    }

  @override
 Widget build(BuildContext context) {
    return Scaffold( appBar:AppBar(
      leading:const Padding(
        padding:  EdgeInsets.all(4.0),
        child:  CircleAvatar(backgroundImage:NetworkImage(AppAssets.im1),radius: 30,),
      ) ,
      title: Column(children: [Text("Hi Heyam ",
      style: Theme.of(context).textTheme.bodyMedium,),
     // Icon(Icons.favorite_border) ,
      Text("lets shopping", style: Theme.of(context).textTheme.bodySmall,selectionColor: AppColors.grey,)]),
      actions: [
        IconButton(onPressed: () {},
         icon:const Icon(Icons.settings_outlined)
         ),
        IconButton(onPressed: () {},
         icon:const Icon(Icons.search)
         ),
       

      ],
    ),
      body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties:const  ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation:const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style10, // Choose the nav bar style with this property.
      ),
    );
  }
}
 
  
