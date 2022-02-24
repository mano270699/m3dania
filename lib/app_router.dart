import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/Cart/cart_screen.dart';
import 'data/api/app_api.dart';
import 'data/repository/app_repository.dart';
import 'presentation/layouts/emaiel_layout_screen.dart';
import 'presentation/screens/login/cubit/login_cubit.dart';
import 'presentation/screens/login/login_screen.dart';
import 'presentation/screens/otpscreen/OtpScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'business_logic/shared/app_cubit/app_cubit.dart';
import 'constants/strings.dart';

class AppRouter {
  LoginCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = LoginCubit(Repository(Api()));
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Root:
        return MaterialPageRoute(
          builder: (_) => SplashScreenView(
            navigateRoute: LoginScreen(),
            duration: 4000,
            text: "App.appName".tr(),
            textType: TextType.ColorizeAnimationText,
            textStyle: TextStyle(
              fontSize: 40.0,
              fontFamily: 'Shamel',
              letterSpacing: 3,
            ),
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade800,
              Colors.blue.shade700,
              Colors.blue.shade600,
              Colors.blue.shade500,
              Colors.blue.shade400,
              Colors.blue.shade300,
              Colors.blue.shade100,
            ],
            backgroundColor: Colors.white,
          ),
        );
      case loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LoginCubit>.value(
                  value: phoneAuthCubit!,
                  child: LoginScreen(),
                ));
      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(Repository(Api())),
                  child: OtpScreen(
                    phoneNumber: phoneNumber,
                  ),
                ));
      case homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => AppCubit(Repository(Api())),
                child: AppLayout()));
      case cartPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => AppCubit(Repository(Api())),
                child: CartScreen()));
    }
  }
}
