import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../business_logic/shared/app_cubit/app_cubit.dart';
import '../../business_logic/shared/app_cubit/app_states.dart';
import 'package:easy_localization/easy_localization.dart';

class AppLayout extends StatelessWidget {
  //const AppLayout({Key key}) : super(key: key);
  //String email = FirebaseAuth.instance.currentUser.email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 30,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontFamily: 'Shamel', fontSize: 12),
            unselectedLabelStyle: TextStyle(fontFamily: 'Shamel', fontSize: 10),
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                label: "App.orders".tr(),
                tooltip: "App.orders".tr(),
                icon: SvgPicture.asset('assets/images/shopping-bagOrder.svg',
                    width: 19, height: 24),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/offer.svg',
                    width: 19, height: 24),
                label: "App.coupons".tr(),
                tooltip: "App.coupons".tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Group984.svg',
                  color: Colors.grey[400],
                  width: 19,
                  height: 24,
                ),
                label: "App.notification".tr(),
                tooltip: "App.notification".tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/sent.svg',
                    width: 19, height: 24),
                label: "App.myorder".tr(),
                tooltip: "App.myorder".tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/material-person.svg',
                    width: 19, height: 24),
                label: "App.profile".tr(),
                tooltip: "App.profile".tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
