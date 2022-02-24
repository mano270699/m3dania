
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/network/local/cache_helper.dart';
import 'constants/strings.dart';
import 'app_router.dart';
import 'business_logic/shared/app_cubit/app_cubit.dart';
import 'constants/bloc_observer.dart';
import 'data/api/app_api.dart';
import 'data/repository/app_repository.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await CacheHelper.init();
  runApp(EasyLocalization(
    path: 'assets/translation',
    supportedLocales: [
      Locale('en'),
      Locale('ar'),
    ],
    startLocale: Locale('en'),
    child: M3dania(
      appRouter: AppRouter(),
    ),
  ));
}

class M3dania extends StatelessWidget {
  final AppRouter appRouter;

  const M3dania({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    local = context.locale.toString();
    return BlocProvider(
      create: (context) => AppCubit(Repository(Api()))..getAllCategories()..getCart(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'M3dania',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
