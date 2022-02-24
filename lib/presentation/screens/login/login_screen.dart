import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../../../data/api/app_api.dart';
import '../../../data/repository/app_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/components/components.dart';
import '../../../constants/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';
import '../../widget/under_ine_text.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginPhoneControler = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => LoginCubit(Repository(Api())),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: w,
              height: h,
              child: Container(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsetsDirectional.only(
                            top: 50, start: 10),
                        alignment: AlignmentDirectional.topStart,
                        height: 100,
                        width: w,
                        child: InkWell(
                          child: _buildSwapLocalIcon(),
                          onTap: () {
                            if (context.locale.toString() == 'ar') {
                              context.setLocale(Locale('en'));
                              setState(() {
                                local = context.locale.toString();
                              });
                            } else {
                              context.setLocale(Locale('ar'));
                              setState(() {
                                local = context.locale.toString();
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'App.appName'.tr(),
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Shamel',
                                  letterSpacing: 4,
                                  color: Colors.blue),
                            ),
                            Text(
                              'App.signInTitle'.tr(),
                              style: TextStyle(
                                  height: 1,
                                  fontSize: 14,
                                  fontFamily: 'Shamel',
                                  color: Colors.blue[300]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: h * 0.10),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 20, end: 20),
                                child: defaultFormText(
                                  controller: loginPhoneControler,
                                  type: TextInputType.phone,
                                  // lable: 'رقم الهاتف..',
                                  hint: "App.phone".tr(),
                                  onSubmit: (value) {
                                    phoneNumber = value!;
                                  },
                                  onSaved: (value) {
                                    phoneNumber = value!;
                                  },
                                  prefixIcon: Icons.phone_android,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      showToast(
                                          msg: 'App.phoneError'.tr(),
                                          background: Colors.red);
                                      return '';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 20, end: 20),
                                child: defaultButton(
                                    text: 'App.signIn'.tr(),
                                    function: () {
                                      showProgressIndecator(context);
                                      _register(context);
                                    }),
                              ),
                              _buildPhoneNumberSubmitedBloc(),
                              SizedBox(
                                height: h * 0.015,
                              ),
                              orDividerComponent(),
                              SizedBox(
                                height: h * 0.015,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: w * 0.85,
                                    child: SignInButton(
                                      Buttons.Google,
                                      text: 'App.signInWithGoogle'.tr(),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.85,
                                    child: SignInButton(
                                      Buttons.Facebook,
                                      text: 'App.signInWithFacebook'.tr(),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.85,
                                    child: SignInButton(
                                      Buttons.AppleDark,
                                      text: 'App.signInWithApple'.tr(),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: h - (h * 0.95)),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 20, end: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          UnderLineText(
                                            color: Colors.blue,
                                            text: 'App.privacy'.tr(),
                                            onTap: () {
                                              _launchURL(
                                                  'http://web.emaie.online/index.php/privacypolicy/');
                                            },
                                          ),
                                          UnderLineText(
                                            color: Colors.blue,
                                            text: 'App.skip'.tr(),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                homePage,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPhoneNumberSubmitedBloc() {
    return BlocListener<LoginCubit, LoginStates>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is PhoneLoadingStates) showProgressIndecator(context);
        if (state is PhoneNumberSubmited) {
          Navigator.pop(context);
          Navigator.pushNamed(context, otpScreen, arguments: phoneNumber);
        }
        if (state is PhoneErrorStates) {
          Navigator.pop(context);
          String errorMsg = (state).error;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorMsg.toString(),
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
    );
  }

  Future<void> _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      _formKey.currentState!.save();
      BlocProvider.of<LoginCubit>(context).submitPhoneNumber(phoneNumber!);
    } else {
      Navigator.pop(context);
      return;
    }
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  Widget _buildSwapLocalIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          height: 35,
          width: 35,
          image: AssetImage(
            context.locale.toString() == 'ar'
                ? 'assets/images/arLocal.png'
                : 'assets/images/enLocal.png',
          ),
        ),
        Text(
          context.locale.toString() == 'ar' ? 'En' : 'ع',
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontFamily: 'Shamel'),
        ),
      ],
    );
  }
}
