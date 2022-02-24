import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/network/local/cache_helper.dart';
import '../../../constants/strings.dart';
import '../../../constants/components/components.dart';
import '../../../constants/my_color.dart';
import '../login/cubit/login_cubit.dart';
import '../login/cubit/login_states.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:easy_localization/easy_localization.dart';

class OtpScreen extends StatelessWidget {
  final phoneNumber;
  OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  late String otpCode;
  Widget _buildIntroText() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'App.verify'.tr(),
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontFamily: 'Shamel',
              fontSize: 24,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child: RichText(
              text: TextSpan(
                text: 'App.verifySubTitle'.tr(),
                style: TextStyle(
                    fontFamily: 'Shamel',
                    color: Colors.blue[400],
                    fontSize: 16,
                    height: 1.5),
                children: <TextSpan>[
                  TextSpan(
                      text: ' $phoneNumber',
                      style: TextStyle(
                        fontSize: 18,
                        color: MyColors.blue,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildIntroText(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPinCodeFields(context),
                SizedBox(
                  height: 20,
                ),
                defaultButton(
                  width: 100,
                  text: 'App.done'.tr(),
                  function: () {
                    showProgressIndecator(context);
                    _login(context);
                    LoginCubit.get(context)
                        .userRegister(phone: phoneNumber)
                        .then((value) {
                      print(LoginCubit.get(context)
                          .registerModel!
                          .data!
                          .accessToken);
                      Navigator.popAndPushNamed(
                        context,
                        homePage,
                      );
                    });

                    // Navigator.popAndPushNamed(context, homePage,)
                    //  navigateAndFinish(context, NameScreen());
                  },
                ),
                _buildVerificationBloc(),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 0, // Space between underline and text
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.white,
                    width: 1.0, // Underline thickness
                  ))),
                  child: InkWell(
                    onTap: () {
                      LoginCubit.get(context)
                          .submitPhoneNumber(phoneNumber)
                          .then((value) {
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      'App.resendMsg'.tr(),
                      style: TextStyle(
                        fontFamily: 'Shamel',
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: PinCodeTextField(
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeColor: MyColors.blue,
          inactiveColor: MyColors.blue,
          inactiveFillColor: Colors.white,
          activeFillColor: MyColors.lightBlue,
          selectedColor: MyColors.blue,
          selectedFillColor: Colors.white,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (submitedCode) {
          otpCode = submitedCode;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
          // setState(() {
          //   currentText = value;
          // });
        },
        appContext: context,
      ),
    );
  }

  void _login(BuildContext context) {
    print('otpCode: $otpCode');
    BlocProvider.of<LoginCubit>(context).submitOTP(otpCode);
  }

  Widget _buildVerificationBloc() {
    return BlocListener<LoginCubit, LoginStates>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is PhoneLoadingStates) showProgressIndecator(context);
        if (state is UserRegisterSuccess) {
          var accessToken = (state).user.data!.accessToken;
          CacheHelper.saveData(key: 'token', value: accessToken);
          // print(accessToken);
        }
        if (state is PhoneOTPVerified) {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            homePage,
          );
          // Navigator.pushReplacementNamed(context, mapScreen);
        }
        if (state is PhoneErrorStates) {
          // Navigator.pop(context);
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
}
