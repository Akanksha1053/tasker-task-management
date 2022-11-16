import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/authenticate_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/otp_authentication_usecase.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/sign_in_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationSource {
  Future<Either<Failure, UserCredential>> authenticateUser(
      CreateUserParams params);
  Future<Either<Failure, UserCredential>> signInUser(SignInParams params);

  Future<Either<Failure, void>> otpAuthentication(
      OtpAuthenticationParams otpAuthenticationParams);
}

class FireBaseAuthenticationSourceImpl implements AuthenticationSource {
  @override
  Future<Either<Failure, UserCredential>> authenticateUser(
      CreateUserParams params) async {
    try {
      final response =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      return Right(response);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left(
            FirebaseAuthFailure(message: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return const Left(FirebaseAuthFailure(
            message: 'The account already exists for that email.'));
      } else {
        return const Left(FirebaseAuthFailure(message: 'An Error Occured'));
      }
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInUser(
      SignInParams params) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: params.email, password: params.password);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left(
            (SignInFailure(message: 'No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        return const Left(
            SignInFailure(message: 'Wrong password provided for that user.'));
      } else {
        print(e.toString());
        return const Left(SignInFailure(message: 'An Error Occured'));
      }
    }
  }

  @override
  Future<Either<Failure, void>> otpAuthentication(
      OtpAuthenticationParams otpAuthenticationParams) async {
    try {
      void isSent = await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: otpAuthenticationParams.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return Right(isSent);
    } on FirebaseAuthException catch (e) {
      return const Left(FirebaseAuthFailure(message: 'Unable to send otp'));
    }
  }
}
