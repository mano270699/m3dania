import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/user_model.dart';
import '../../../../data/repository/app_repository.dart';

import '../../../../constants/strings.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.repository) : super(PhoneInitalStates());
  static LoginCubit get(context) => BlocProvider.of(context);
  UserRegisterModel? registerModel;
  final Repository? repository;
  Future<void> userRegister({
    required String phone,
  }) async {
    await repository!.getRegisterPhone(phone: phone).then((phone) {
      this.registerModel = phone;
      emit(UserRegisterSuccess(registerModel!));

      print("accessToken ->${registerModel!.data!.accessToken}");
    }).catchError((onError) {
      print(onError);

      emit(UserRegisterError());
    });
    // ShopRegisterModel RegisterModel;
  }

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(PhoneLoadingStates());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(PhoneErrorStates(error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    verificationIds = verificationId;

    emit(PhoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIds, smsCode: otpCode);

    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOTPVerified());
    } catch (error) {
      emit(PhoneErrorStates(error.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }

  /*                                End Phone Auth             */

}
