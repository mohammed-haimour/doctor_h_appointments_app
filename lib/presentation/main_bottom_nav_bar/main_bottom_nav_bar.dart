import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/routing/app_router.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  final List<Widget> _buildScreens = [
      Navigator(
        key: GlobalKey<NavigatorState>(),
        initialRoute: Routes.homeScreen,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      ),
      Navigator(
        key: GlobalKey<NavigatorState>(),
        initialRoute: Routes.doctorsScreen,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      ),
      Navigator(
        key: GlobalKey<NavigatorState>(),
        initialRoute: Routes.bookAnAppointment,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      ),
      Navigator(
        key: GlobalKey<NavigatorState>(),
        initialRoute: Routes.specializations,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      ),
      Navigator(
        key: GlobalKey<NavigatorState>(),
        initialRoute: Routes.settings,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      ),
    ];


  final List<PersistentBottomNavBarItem> _navBarsItems = [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: "Home",
        activeColorPrimary: Constants.colorDarkBlueDoctorH,
        inactiveColorPrimary: Constants.colorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.people),
        title: "Doctors",
        activeColorPrimary: Constants.colorDarkBlueDoctorH,
        inactiveColorPrimary: Constants.colorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: "Book",
        activeColorPrimary: Constants.colorDarkBlueDoctorH,
        activeColorSecondary: Constants.colorWhite,
        iconSize: 30,
        inactiveColorPrimary: Constants.colorDarkBlueDoctorH,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.style),
        title: "Specialization",
        activeColorPrimary: Constants.colorDarkBlueDoctorH,
        inactiveColorPrimary: Constants.colorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: "Settings",
        activeColorPrimary: Constants.colorDarkBlueDoctorH,
        inactiveColorPrimary: Constants.colorGrey,
      ),
    ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens,
      items: _navBarsItems,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: (getIt<UserBusinessInterface>().userPreferences!.theme ==
              ThemeMode.light)
          ? Constants.colorWhiteLessSmoke
          : Constants.colorTransparentBlack,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style15,
    );
  }
}
