import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/presentation/book_an_appointment/book_an_appointment_screen.dart';
import 'package:doctor_h_appointments_app/presentation/doctors/doctors_screen.dart';
import 'package:doctor_h_appointments_app/presentation/home/home_screen.dart';
import 'package:doctor_h_appointments_app/presentation/settings/settings_screen.dart';
import 'package:doctor_h_appointments_app/presentation/specializations/specializations_screen.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
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

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const DoctorsScreen(),
      const BookAnAppointmentScreen(),
      const SpecializationsScreen(),
      const SettingsScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Constants.colorDarkBlueDoctorH,
        inactiveColorPrimary: Constants.colorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.people),
        title: ("Doctors"),
        activeColorPrimary: Constants.colorDarkBlueDoctorH,
        inactiveColorPrimary: Constants.colorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: ("Book"),
        activeColorPrimary: Constants.colorDarkBlueDoctorH,
        activeColorSecondary: Constants.colorWhite,
        iconSize: 30,
        inactiveColorPrimary: Constants.colorDarkBlueDoctorH,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.style),
        title: ("Specialization"),
        activeColorPrimary: Constants.colorDarkBlueDoctorH,
        inactiveColorPrimary: Constants.colorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: Constants.colorDarkBlueDoctorH,
        inactiveColorPrimary: Constants.colorGrey,
      ),
    ];
  }

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
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
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
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property
    );
  }
}
